from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import func
from sqlmodel import select
from models import *
from db import engine
from cookie import cookie,verifier

router = APIRouter(
    prefix="/state",
    # tags=["items"],
    # dependencies=[Depends(get_token_header)],
    # responses={404: {"description": "Not found"}},
)

@router.get("/{item_id}",dependencies=[Depends(cookie)])
async def get_balance(item_id :int,session_data: User = Depends(verifier)):
    with Session(engine) as session:
        statement=""
        match item_id:
            case 0:
                statement =  text('''
                    select wallet.name, sum(node.amount) as amount from node left join wallet on wallet.id  = node.wallet where node.user = :email  group by wallet;
                ''')
            case 1:
                statement =  text('''
                    select node.tag as tag,sum(node.amount) as sum  from node where node.user = :email group by tag ;
                ''')
            case _:
                statement = text('''
                    select  
                    sum(case when node.amount >=0 then node.amount  else 0 end) as Income,
                    abs(sum(case when node.amount <0 then node.amount  else 0 end)) as Expensize
                    from node where node.user = :email;
                ''')
                results = session.exec(statement,params={"email":session_data.email})
                a = results.all()
                b = {"Income":a[0][0],"Expense":a[0][1]}
                return b
        results = session.exec(statement,params={"email":session_data.email})
        a = results.all()
        print(a)
        b = {key: value for key, value in a}
        return b

