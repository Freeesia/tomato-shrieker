#!/bin/sh
# rsyslogをバックグラウンドで実行
rsyslogd

# bundle exec rake restart
bundle exec rake restart

# 引数があったら実行する
if [ "$#" -gt 0 ]; then
  exec "$@"
# 引数がなかったらsleep infinityする
else
  sleep infinity
fi
