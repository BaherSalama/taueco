from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import select
from models import *
from db import engine
from cookie import cookie,verifier

router = APIRouter(
    prefix="/wallet",
    # tags=["items"],
    # dependencies=[Depends(get_token_header)],
    # responses={404: {"description": "Not found"}},
)


@router.post("/",dependencies=[Depends(cookie)])
async def add_wallet(wallet: Wallet,session_data: User = Depends(verifier)):
    with Session(engine) as session:
        wallet.user = session_data.email
        session.add(wallet)
        session.commit()
        session.refresh(wallet)
        return wallet



@router.get("/",dependencies=[Depends(cookie)])
async def get_wallet(session_data: User = Depends(verifier)):
    with Session(engine) as session:
        statement = select(Wallet).where(Wallet.user == session_data.email)
        results = session.exec(statement)
        return results.all()
    return "aaaaaaah"



@router.delete("/",dependencies=[Depends(cookie)])
async def delete_wallet(wallet: Wallet,session_data: User = Depends(verifier)):
    with Session(engine) as session:
        a=select(Wallet).where(Wallet.id == wallet.id)
        b = session.exec(a).one()
        session.delete(b)
        session.commit()
