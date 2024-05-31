from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import select
from models import *
from db import engine
from cookie import cookie,verifier

router = APIRouter(
    prefix="/tag",
    # tags=["items"],
    # dependencies=[Depends(get_token_header)],
    # responses={404: {"description": "Not found"}},
)

@router.get("/",dependencies=[Depends(cookie)])
async def get_wallet(session_data: User = Depends(verifier)):
    with Session(engine) as session:
        statement = select(Tag)
        results = session.exec(statement)
        return results.all()
    return "aaaaaaah"

