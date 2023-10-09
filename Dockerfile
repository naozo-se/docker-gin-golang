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
ARG TIMEZONE
ARG GOPROJNAME

# タイムゾーン設定
ENV TZ $TIMEZONE

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
RUN go install github.com/cosmtrek/air@latest

# プロジェクト名設定
ENV GOPROJNAME $GOPROJNAME
