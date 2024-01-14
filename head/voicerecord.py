import pyaudio
import wave
import os
import time
import pygame
from gtts import gTTS
import tempfile

def text_to_speech(text, language='en', filename='temp_tts.mp3'):
    tts = gTTS(text=text, lang=language, slow=False)
    temp_dir = tempfile.mkdtemp()
    tts.save(os.path.join(temp_dir, filename))
    return temp_dir

def play_audio(filename):
    pygame.mixer.init()
    pygame.mixer.music.load(filename)
    pygame.mixer.music.play()
    while pygame.mixer.music.get_busy():
        pygame.time.Clock().tick(10)

def record_audio_and_save(sentence, output_folder='records', duration=4, num_recordings=10):
    # Create output folder if it doesn't exist
    os.makedirs(output_folder, exist_ok=True)

    for i in range(1, num_recordings + 1):
        print(f"Recording {i}/{num_recordings} - Sentence: {sentence}...")

        # Convert sentence to speech and play it
        temp_dir = text_to_speech(sentence)
        play_audio(os.path.join(temp_dir, 'temp_tts.mp3'))

        # Wait for the TTS to finish before starting the recording
        time.sleep(2)  # Adjust the duration based on the TTS length

        # Record audio using pyaudio
        p = pyaudio.PyAudio()
        stream = p.open(format=pyaudio.paInt16,
                        channels=2,
                        rate=44100,
                        input=True,
                        frames_per_buffer=1024)

        frames = []
        for _ in range(int(44100 / 1024 * duration)):
            data = stream.read(1024)
            frames.append(data)

        stream.stop_stream()
        stream.close()
        p.terminate()

        # Save the recording as a WAV file
        output_filename = os.path.join(output_folder, f'audio_segment_{i}.wav')
        wf = wave.open(output_filename, 'wb')
        wf.setnchannels(2)
        wf.setsampwidth(pyaudio.PyAudio().get_sample_size(pyaudio.paInt16))
        wf.setframerate(44100)
        wf.writeframes(b''.join(frames))
        wf.close()

        print(f"audio_segment_{i}/{num_recordings} saved as {output_filename}")

if __name__ == "__main__":
    sentence_to_read = "This is the sentence to be read during recording."

    # Repeat the recording loop 10 times
    for _ in range(10):
        record_audio_and_save(sentence_to_read)
