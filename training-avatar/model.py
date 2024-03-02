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


Datadir = "./Dataset/coma_data/FaceTalk_170725_00137_TA"
categories = ["bareteeth", "cheeks_in", "eyebrow", "high_smile", "lips_back", "lips_up", "mouth_down",
              "mouth_down", "mouth_extreme", "mouth_middle", "mouth_open", "mouth_side", "mouth_up"]
training_data = []

def creating_training_data():
    for category in categories:
        path = os.path.join(Datadir, category)
        class_num = categories.index(category)
        for file in os.listdir(path):
            if file.endswith(".ply"):
                try:
                    # Read the .ply file using trimesh
                    mesh = trimesh.load(os.path.join(path, file))
                    # Process the mesh data as needed
                    vertices = mesh.vertices
                    faces = mesh.faces
                    # Example: Save vertices and faces to training_data list
                    training_data.append([vertices, faces, class_num])
                except Exception as e:
                    # Print an error if unable to load the file
                    print(f"Error loading file {os.path.join(path, file)}: {e}")

creating_training_data()


X = np.random.rand(1000, image_height, image_width, num_channels)  # Placeholder images
y = np.random.rand(1000, num_vertices, 3)  # Placeholder mesh coordinates

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)



def cnn(inputs):
 
  x = Conv2D(32, (3, 3), activation='relu', padding='same')(inputs)
  x = Conv2D(64, (3, 3), activation='relu', padding='same')(x)
  # Add more Dense layers or adjust existing ones to achieve output shape of (None, 100)
  x = Flatten()(x)
  x = Dense(128, activation='relu')(x)  # Example modification
  outputs = Dense(100)(x)  # Ensure output shape is (None, 100)
  model = Model(inputs, outputs, name='cnn')
  return outputs



def build_generator(latent_dim, output_dim):
      inputs = Input(shape=(latent_dim + 100,))
      x = Dense(128, activation='relu')(inputs)
      x = Dense(256, activation='relu')(x)
      x = Dense(output_dim, activation='tanh')(x)  # Output shape: (num_vertices * 3,)
      outputs = Reshape((output_dim // 3, 3))(x)  # Reshape to (num_vertices, 3)
      model = Model(inputs, outputs, name='generator')
      return model


import random 

random.shuffle(training_data)



image_input = Input(shape=(image_height, image_width, num_channels))  # No batch dimension
latent_input = Input(shape=(latent_dim,))  

features = cnn(image_input)
combined_input = tf.concat([features, latent_input], axis=1)
print(f"Combined input shape after concatenation: {combined_input}")  # Track combined input shape

generator_vertices = build_generator(latent_dim, num_vertices * 3)
generated_mesh_vertices = generator_vertices(combined_input)

combined_model = Model(inputs=[image_input, latent_input], outputs=generated_mesh_vertices)

# Compile the model
combined_model.compile(loss=MeanSquaredError(), optimizer=Adam(learning_rate=learning_rate))

# Train the model
combined_model.fit([X_train, np.zeros((len(X_train), latent_dim))], y_train, epochs=epochs, batch_size=batch_size, validation_data=([X_test, np.zeros((len(X_test), latent_dim))], y_test))

combined_model.save('my_mesh_generator.keras') 




