from fastapi import APIRouter, Depends, WebSocket,BackgroundTasks
from sqlmodel import select
from models import *
from db import engine
from cookie import cookie,verifier
from sqlalchemy import func, text
import threading




router = APIRouter()

@router.websocket("/{user_id}")
async def websocket_endpoint(websocket: WebSocket,user_id):
    await websocket.accept()
    while True:
        a = await checktasks()
        if user_id in a:
            await websocket.send_text(f"Aaaaah")