from contextlib import asynccontextmanager
from fastapi import FastAPI
from models import User
from db import SQLModel, engine
from sqlmodel import SQLModel
from routers import node, user, wallet, tag
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


if __name__ == '__main__':
    uvicorn.run("main:app",
                host='127.0.0.1',
                port=8000,
                log_level="info",
                reload=True)
    print("running")
