# Ruby 3系のイメージをベースにする
FROM ruby:3

# ワーキングディレクトリの設定
WORKDIR /app

COPY . .

# 必要なライブラリのインストール、Githubリポジトリのダウンロード、bundle install、パッケージリストの削除を1つのRUNコマンドで実行
RUN apt-get update -qq && \
    apt-get install -y sqlite3 rsyslog && \
    gem install bundler && \
    bundle install && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    cp docker/rsyslog.conf /etc/rsyslog.conf && \
    chmod +x docker/entrypoint.sh
    
# entrypoint.shを実行
ENTRYPOINT ["docker/entrypoint.sh"]
