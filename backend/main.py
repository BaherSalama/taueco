from fastapi import FastAPI
#from .db import engine, SQLModel
from models import *
from db import SQLModel,engine
# One line of FastAPI imports here later 👈
from sqlmodel import Field, Session, SQLModel, create_engine, select


app = FastAPI()

@app.on_event('startup')
async def on_startup():
    SQLModel.metadata.create_all(engine)


@app.post("/node")
async def add_node(node : Node):
    with Session(engine) as session:
        session.add(node)
        session.commit()
        session.refresh(node)
        return node


@app.post("/user")
async def add_user(user : User):
    with Session(engine) as session:
        session.add(user)
        session.commit()
        session.refresh(user)
        return user

@app.get("/")
async def root():
    return {"message": "Hello World"}

