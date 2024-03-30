# イメージ指定
ARG GOIMGVER
FROM golang:$GOIMGVER

# パッケージ更新＆追加
RUN apt-get update && apt-get install -y \
    git \
    vim \ 
    curl

# env指定パラメータ
ARG USERNAME
ARG GROUPNAME
ARG UID
ARG GID
ARG WORKDIR
ARG GOPROJNAME
ARG AIRVER

# ユーザー追加
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME

# すべてのファイルをnodeユーザーのものに
RUN mkdir -p $WORKDIR
RUN chown -R $USERNAME:$USERNAME $WORKDIR

# ユーザー切り替え
USER $USERNAME

# 作業ディレクトリ設定
WORKDIR $WORKDIR

# air をインストール
RUN go install github.com/cosmtrek/air@$AIRVER
