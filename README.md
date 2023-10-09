# （動作確認）環境
- Windows10 on WSL2(Ubuntu 22.04.3 LTS)
- Docker version 24.0.6, build ed223bc
- Docker Compose version v2.4.1

# 始め方
1. コンテナ立ち上げ
  ```shell
  docker compose up -d
  ```

1. VS-CODE
  - 左下メニュ → `Connect to WSL` (新ウィンドウ開く)
  - 左下メニュー → Attach to Running Container
  - Goファイルを開く → 右下ダイアログのすべてに`ALL INSTALL `

# ざっくり説明
- 自動起動
- air入り（編集毎ビルド）
