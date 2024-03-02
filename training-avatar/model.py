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

image_height, image_width, num_channels = 128, 128, 3  # Image dimensions and channels
latent_dim = 100  # Dimensionality of the latent space
num_vertices = 1000  # Example number of vertices for the mesh
epochs = 10  # Training epochs
batch_size = 32  # Training batch size
learning_rate = 0.0005  # Learning rate for Adam optimizer (adjust based on experiment results)