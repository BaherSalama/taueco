from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import select
from models import *
from db import engine
from cookie import cookie,verifier
from main import gold,inflation
router = APIRouter(
    prefix="/ai",
    # tags=["items"],
    # dependencies=[Depends(get_token_header)],
    # responses={404: {"description": "Not found"}},
)


@router.get("/",dependencies=[Depends(cookie)])
async def get_ai(session_data: User = Depends(verifier)):
    if (inflation < gold):
        return {"massage":"acording to the data provided i would recomend that you invest in Gold"}
    else:
        if (inflation>2.5):
            return {"massage":"acording to the data provided i would recomend that Take a lone from a bank"}
        else:
            return {"massage":"acording to the data provided i would recomend investing in stock"}
            
        
# @router.update("/",dependencies=[Depends(cookie)])
# async def update_node(node: Node,session_data: User = Depends(verifier)):
#     print(node)
#     with Session(engine) as session:
#         a=select(Node).where(Node.name == node.name and Node.user == session_data.email)
#         for i in session.exec(a).all():
#             session.delete(i)
#         session.commit()
