# import subprocess
# import pygame
# import io

# def speak(text):
#     voice="en-us-GuyNeural"
#     command=f'edge-tts --voice "{voice}" --text "{text}" --rate=+30%'
    
#     try:
#         audio_data=subprocess.check_output(command, shell=True)

#         pygame.init()
#         pygame.mixer.init()

#         audio_buffer =io.BytesIO(audio_data)

#         pygame.mixer.music.load(audio_buffer)

#         pygame.mixer.music.play()
#         while pygame.mixer.music.get_busy():
#             pygame.time.clock().tick(10)

#     except subprocess.CalledProcessError as e:
#         print(f"Error running command: {e}")
#     finally:
#         pygame.mixer.music.stop()
#         pygame.mixer.quit()
import pyttsx3

engine = pyttsx3.init()

def speak(text):
    engine.say(text)
    engine.runAndWait()