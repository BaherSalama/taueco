from contextlib import asynccontextmanager
from lib2to3.pytree import Node
import threading
from fastapi import FastAPI, BackgroundTasks
from sqlalchemy import select, text
from db import  engine
from routers import node, user, wallet, tag,ws, state
from models import *
import uvicorn
import time
# startup event
@asynccontextmanager
async def lifespan(app: FastAPI):
    SQLModel.metadata.create_all(engine)
    yield


app = FastAPI(lifespan=lifespan)
app.include_router(user.router)
app.include_router(node.router)
app.include_router(wallet.router)
app.include_router(tag.router)
app.include_router(ws.router)
app.include_router(state.router)

class BackgroundTasks(threading.Thread):
    def run(self,*args,**kwargs):
        while True:
            with Session(engine) as session:
                statement = select(Node,text("datetime(node.date,node.interval)")).where(text("(julianday(node.date,node.interval)- julianday('now','+3 hours')) < 0"))
                results = session.exec(statement)
                change = results.all()
                for i,j in change:
                    clone = Node(**i.model_dump())
                    clone.id = None
                    clone.date = j
                    clone.total -= clone.amount
                    if abs(clone.total)-abs(clone.amount) <= 0:
                        clone.interval = ""
                    i.interval = ""
                    session.add(clone)
                    session.add(i)
                    session.commit()
            time.sleep(5)


if __name__ == '__main__':
    t = BackgroundTasks()
    t.start()
    uvicorn.run("main:app",
                host='127.0.0.1',
                port=8000,
                log_level="info",
                reload=True)
    t.join()
    
