from fastapi import APIRouter, HTTPException, Response
from sqlmodel import select
from models import *
from db import engine
from cookie import cookie,backend,verifier,uuid4


router = APIRouter(
    prefix="/user",
    # tags=["items"],
    # dependencies=[Depends(get_token_header)],
    # responses={404: {"description": "Not found"}},
)


@router.post("/")
async def add_user(user: User):
    with Session(engine) as session:
        session.add(user)
        session.commit()
        session.refresh(user)
        return user


@router.post("/login")
async def login(user: User, response: Response):
    with Session(engine) as session:
        statement = select(User).where(User.email == user.email)
        results = session.exec(statement)
        if len(results.all()) < 1:
            raise HTTPException(
                status_code=403,
                detail="No user")
    session = uuid4()
    data = user
    await backend.create(session, data)
    cookie.attach_to_response(response, session)
    return f"created session for {user}"
