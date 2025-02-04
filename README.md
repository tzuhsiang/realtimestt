# 執行指令

docker run -it --rm --device /dev/snd my-realtime-stt-app

# --device /dev/snd 允許容器使用主機的聲音設備進行語音錄製。
# --rm 參數會在容器退出後自動刪除容器。
