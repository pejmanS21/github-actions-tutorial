import numpy as np


def random_gen(a: int, b: int):
    data = np.random.random((a, b))
    return data


if __name__ == "__main__":
    print(random_gen(10, 1).shape)
