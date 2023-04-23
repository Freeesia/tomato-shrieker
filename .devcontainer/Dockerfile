FROM mcr.microsoft.com/devcontainers/ruby:0-3-bullseye

# 必要なライブラリのインストール、パッケージリストの削除を1つのRUNコマンドで実行
RUN apt-get update -qq && \
    apt-get install -y sqlite3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
