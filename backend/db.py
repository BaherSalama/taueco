from sqlmodel import SQLModel, create_engine
from models import * 


sqlite_file_name = "database.db"
sqlite_url = f"sqlite:///{sqlite_file_name}"
connect_args = {"check_same_thread": False}

engine = create_engine(sqlite_url,echo=True)
