import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler
import keras
from keras.models import Sequential
from keras.layers import Dense, Dropout
from keras.optimizers import SGD
import math
from keras.utils.vis_utils import plot_model
import uuid
from polyaxon_client.tracking import Experiment, get_log_level, get_data_paths, get_outputs_path
from polyaxon_client.tracking.contrib.keras import PolyaxonKeras
import argparse
import os
import subprocess

experiment = Experiment()

# 0. Read Args
if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    
os.chdir('DeepSpeech')
subprocess.call(['./bin/run-ldc93s1.sh'])
