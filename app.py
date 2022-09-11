import random

import numpy as np
import uvicorn
from fastapi import FastAPI

app = FastAPI()


def random_gen(a: int, b: int):
    data = np.random.random((a, b))
    return data


@app.get("/")
def index():
    return {"status": 200}


@app.get("/rnd")
def rnd_endpoint():
    return {"random number": random.randint(1, 100)}


if __name__ == "__main__":
    uvicorn.run("app:app", host="0.0.0.0", port=8000)
