from contextlib import asynccontextmanager
import threading
from fastapi import FastAPI, BackgroundTasks
from db import SQLModel, engine
from sqlmodel import SQLModel
from routers import node, user, wallet, tag,ws, state

import uvicorn

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


def sad():
    while True:
        ws.yarab = ws.checktasks()
        print("sadeaieea")


if __name__ == '__main__':
    # background_thread = threading.Thread(target=sad)
    # background_thread.start()

    uvicorn.run("main:app",
                host='127.0.0.1',
                port=8000,
                log_level="info",
                reload=True)
    
