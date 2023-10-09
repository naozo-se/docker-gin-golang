# ソースフォルダに移動
cd ./src

if [ ! -e '/check' ]; then
    touch /check
    # 初回起動時にプロジェクト
    go mod init $GOPROJNAME
fi

# パッケージ見直し
go mod tidy

# 実行
# go run main.go
air
