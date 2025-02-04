# Realtime Speech-to-Text (STT) 系統

## 專案目標

本專案旨在建立一個即時語音轉文字（STT, Speech-to-Text）系統，能夠從音頻來源（如麥克風）中即時捕捉語音，並轉換為可用文字。此系統適用於各類語音處理應用，例如語音辨識、語音助手、語音分析等。

專案特點包括：
- 支援即時語音錄製並轉換成文字
- 能夠進行情感分析或其他語言處理任務
- 基於 Docker 容器，便於跨平台部署

## 執行指令

在此專案中，您可以透過 Docker 容器來執行語音轉文字應用，以下是啟動容器的指令：

```bash
docker run -it --rm --device /dev/snd my-realtime-stt-app

# --device /dev/snd 允許容器使用主機的聲音設備進行語音錄製。
# --rm 參數會在容器退出後自動刪除容器。