import random
import time
import unittest

from app import random_gen


class TestModule(unittest.TestCase):
    def test_module(self):
        time.sleep(0.3)
        self.assertTrue(random_gen(10, 1).shape == (10, 1))

    def test_random(self):
        time.sleep(0.3)
        self.assertTrue(random.randint(1, 100) <= 100)


if __name__ == "__main__":
    unittest.main()
