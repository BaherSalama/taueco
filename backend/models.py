#from pydantic import BaseModel
from sqlmodel import Field, Session, SQLModel, create_engine

class User(SQLModel,table=True):
    email:str|None = Field(default=None, primary_key=True)
    username:str
    password:str

class Node(SQLModel,table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str
    total: float
    amout: float
    interval : str
    tag: str
    wallet : str
    date : str
    user : str | None = Field(default=None,foreign_key="user.email")

