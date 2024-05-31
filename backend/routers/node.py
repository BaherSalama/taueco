from fastapi import APIRouter, Depends, HTTPException
from models import *
from db import engine
from cookie import cookie,verifier

router = APIRouter(
    prefix="/node",
    # tags=["items"],
    # dependencies=[Depends(get_token_header)],
    # responses={404: {"description": "Not found"}},
)


@router.get("/",dependencies=[Depends(cookie)])
async def add_node(session_data: User = Depends(verifier)):
    return session_data


