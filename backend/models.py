from datetime import datetime
#from pydantic import BaseModel
from sqlalchemy import text
from sqlmodel import Field, Session, SQLModel, create_engine,TIMESTAMP


yarab = []


class User(SQLModel,table=True):
    email:str|None = Field(default=None, primary_key=True)
    username:str|None
    password:str


class Wallet(SQLModel,table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str
    code: str
    user : str | None = Field(default=None,foreign_key="user.email")


class Tag(SQLModel,table=True):
    name: str | None = Field(default=None, primary_key=True)


class Node(SQLModel,table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str
    type: int
    total: float
    amount: float
    interval : str
    tag: str | None = Field(default=None,foreign_key="tag.name")
    wallet : int| None = Field(default=None,foreign_key="wallet.id")
    date : str = Field(default=text("datetime('now','+3 hours')"))
    user : str | None = Field(default=None,foreign_key="user.email")

