import tensorflow as tf
from tensorflow.keras.layers import Input, Conv2D, Flatten, Dense, Reshape, Conv2DTranspose
from tensorflow.keras.models import Model
from tensorflow.keras.losses import MeanSquaredError
from tensorflow.keras.optimizers import Adam
from sklearn.model_selection import train_test_split
import numpy as np
import trimesh
import os
from tensorflow.keras.preprocessing import image  # For image loading
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.models import load_model