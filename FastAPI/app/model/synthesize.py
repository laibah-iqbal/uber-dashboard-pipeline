import pickle
from pathlib import Path
from sdv.single_table import GaussianCopulaSynthesizer
import random

BASE_DIR = Path(__file__).resolve(strict=True).parent

synthesizer = GaussianCopulaSynthesizer.load(
filepath=f"{BASE_DIR}/synthesizer.pkl"
)

def synthesize():
    #num_rows = random.randint(1,50)
    return synthesizer.sample(num_rows=1)