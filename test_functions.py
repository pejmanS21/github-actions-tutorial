import random
import time

import pytest

from app import random_gen


def test_random_num(a: int = 5, b: int = 2):
    assert random_gen(a, b).shape == (a, b)


def test_about_num():
    randnum = random.randint(1, 100)
    assert randnum >= 1
    assert randnum <= 100
