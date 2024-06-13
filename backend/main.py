from contextlib import asynccontextmanager
from lib2to3.pytree import Node
import threading
from fastapi import Depends, FastAPI, BackgroundTasks
from sqlalchemy import select, text
from db import  engine
from routers import node, user, wallet, tag,ws, state
from models import *
import uvicorn
import time
import pandas as pd
from sklearn.ensemble import ExtraTreesRegressor
from cookie import cookie,verifier

# Read datasets
inflation = 0
gold = 0

def Ai():

    data = pd.read_csv('./InflationIndicator_pro.csv')

    clf = ExtraTreesRegressor(random_state=1)

    target_features = ["InterestRate","XAU_Price","gdp_rate","USD_EGP"]
    target = data[target_features]
    X = ["year","month","day"]
    clf.fit(data[X],target)

    # Get today's date
    today = pd.Timestamp.today()

    # Use DateOffset for efficient month addition
    one_month_offset = pd.DateOffset(weeks=4)

    # Generate end date (one month after today)
    end_date = today + one_month_offset

    # Create a date range from today to the end date (inclusive)
    date_range = pd.date_range(start=today, end=end_date, freq='D')  # Daily frequency
    df = pd.DataFrame({
        'year': date_range.year,
        'month': date_range.month,
        'day': date_range.day,
    })


    val_predictions = clf.predict(df)
    global inflation
    inflation = (val_predictions[0,0]- val_predictions[-1,0]) / val_predictions[0,0]
    global gold 
    gold = (val_predictions[0,1]- val_predictions[-1,1]) / val_predictions[0,1]
    # Print the generated month of dates
# startup event
@asynccontextmanager
async def lifespan(app: FastAPI):
    SQLModel.metadata.create_all(engine)
    Ai()
    yield


app = FastAPI(lifespan=lifespan)
app.include_router(user.router)
app.include_router(node.router)
app.include_router(wallet.router)
app.include_router(tag.router)
app.include_router(ws.router)
app.include_router(state.router)


@app.get("/ai",dependencies=[Depends(cookie)])
async def get_ai(session_data: User = Depends(verifier)):
    if (inflation < gold):
        return {"massage":"Considering the data, gold could be a suitable investment for your portfolio."}
    else:
        if (inflation>2.5):
            return {"massage":"Based on the information you've shared, a bank loan might be a good option for you."}
        else:
            return {"massage":"Based on the information you've shared, investing in stocks could be a potential option for you."}
class BackgroundTasks(threading.Thread):
    def run(self,*args,**kwargs):
        while True:
            with Session(engine) as session:
                statement = select(Node,text("datetime(node.date,node.interval)")).where(text("(julianday(node.date,node.interval)- julianday('now','+3 hours')) < 0"))
                results = session.exec(statement)
                change = results.all()
                for i,j in change:
                    clone = Node(**i.model_dump())
                    clone.id = None
                    clone.date = j
                    if abs(clone.total) < abs(clone.amount):
                        clone.amount = clone.total
                    clone.total -= clone.amount
                    if abs(clone.total) == 0:
                        clone.interval = ""
                    i.interval = ""
                    session.add(clone)
                    session.add(i)
                    session.commit()
            time.sleep(1)


if __name__ == '__main__':
    t = BackgroundTasks()
    t.start()
    uvicorn.run("main:app",
                host='0.0.0.0',
                port=8000,
                log_level="info",
                reload=True)
    t.join()
    
