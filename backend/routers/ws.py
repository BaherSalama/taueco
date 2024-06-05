import asyncio
from datetime import time
from fastapi import APIRouter, Depends, WebSocket,BackgroundTasks
from sqlmodel import select
from models import *
from db import engine
from cookie import cookie,verifier
import parsedatetime as pdt
from sqlalchemy import func, text
import threading

async def checktasks():
    # Simulate a slow operation
    await asyncio.sleep(60)
    # time.sleep(1)
    with Session(engine) as session:
        statement = select(Node,text("datetime(node.date,node.interval)")).where(text("(julianday(node.date,node.interval)- julianday('now','+3 hours')) < 0 AND abs(node.total)-abs(node.amount) >= abs(node.amount)"))
        statement2 = select(Node.user).where(text("(julianday(node.date,node.interval)-julianday('now','+3 hours')) < 0 AND abs(node.total)-abs(node.amount) >= abs(node.amount)"))
        results = session.exec(statement)
        results2 = session.exec(statement2)
        change = results.all()
        notify = results2.all()
        for i,j in change:
            clone = Node(**i.model_dump())
            clone.id = None
            clone.date = j
            clone.total -= clone.amount
            i.interval = ""
            session.add(clone)
            session.add(i)
            session.commit()
        print(notify)
        return notify


router = APIRouter()

@router.websocket("/{user_id}")
async def websocket_endpoint(websocket: WebSocket,user_id):
    await websocket.accept()
    print(user_id)
    while True:
        a = await checktasks()
        if user_id in a:
            await websocket.send_text(f"Aaaaah")