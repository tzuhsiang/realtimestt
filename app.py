import speech_recognition as sr
from transformers import pipeline
from stt.stt import transcribe_audio_to_json

# 初始化語音辨識器和情感分析管道
recognizer = sr.Recognizer()
sentiment_analyzer = pipeline("sentiment-analysis")

# 使用麥克風作為音頻來源
with sr.Microphone() as source:
    print("請開始說話...")
    recognizer.adjust_for_ambient_noise(source)  # 調整背景噪聲
    audio = recognizer.listen(source)  # 捕捉語音
    print("正在聽取語音...")

    audio = recognizer.listen(source)  # 捕捉語音

# 將捕捉的語音轉換成文字
try:
    print("正在辨識語音...")
    content = transcribe_audio_to_json(audio)
    print(content)
    text = recognizer.recognize_google(audio, language="zh-TW")  # 使用 Google 語音辨識
    print(f"語音轉文字結果: {text}")

except sr.UnknownValueError:
    print("語音無法理解")
except sr.RequestError as e:
    print(f"語音辨識服務出錯: {e}")
