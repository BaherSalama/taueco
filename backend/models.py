#from pydantic import BaseModel
from sqlmodel import Field, Session, SQLModel, create_engine






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
    total: float
    amout: float
    interval : str
    tag: str | None = Field(default=None,foreign_key="tag.name")
    wallet : str
    date : str
    user : str | None = Field(default=None,foreign_key="user.email")

