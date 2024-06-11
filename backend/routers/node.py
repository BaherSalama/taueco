from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import select
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
async def get_node(session_data: User = Depends(verifier)):
    with Session(engine) as session:
        statement = select(Node).where(Node.user == session_data.email)
        results = session.exec(statement)
        return results.all()


@router.post("/",dependencies=[Depends(cookie)])
async def add_node(node: Node,session_data: User = Depends(verifier)):
    with Session(engine) as session:
        node.user = session_data.email
        node.total -= node.amount
        session.add(node)
        session.commit()
        session.refresh(node)
        return node


@router.delete("/",dependencies=[Depends(cookie)])
async def delete_node(node: Node,session_data: User = Depends(verifier)):
    print(node)
    with Session(engine) as session:
        a=select(Node).where(Node.name == node.name and Node.user == session_data.email)
        for i in session.exec(a).all():
            session.delete(i)
        session.commit()



# @router.update("/",dependencies=[Depends(cookie)])
# async def update_node(node: Node,session_data: User = Depends(verifier)):
#     print(node)
#     with Session(engine) as session:
#         a=select(Node).where(Node.name == node.name and Node.user == session_data.email)
#         for i in session.exec(a).all():
#             session.delete(i)
#         session.commit()
