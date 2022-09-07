import random

import numpy as np
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
    print(random_gen(random.randint(1, 10), 1))
