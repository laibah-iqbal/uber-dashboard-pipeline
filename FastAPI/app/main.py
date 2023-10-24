from typing import Union
from fastapi import FastAPI
from fastapi import Response
from pydantic import BaseModel
import pydantic
import json
from app.model.synthesize import synthesize
import pandas as pd
from datetime import datetime

app = FastAPI()

class DataModel(BaseModel):
    key: datetime
    fare_amount: int
    pickup_date: datetime
    passengers: int
    pickup_latlong: str
    dropoff_latlong: str
    created_at: datetime

@app.get("/")
def home():
    return {"health_check": "OK"}


@app.get("/synthesize", response_model=DataModel)
def synthesize_record():
    df = synthesize()
    # df = df[['key','fare_amount','pickup_datetime', \
    #         'passenger_count','pickup lat long','dropoff lat long']]
    df["key"] = datetime.now()
    df["created_at"] = datetime.now()
    return Response(df.to_json(orient="records", date_format="iso")[1:-1], media_type="application/json")