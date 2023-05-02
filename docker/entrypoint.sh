#!/bin/sh

# INTERVALが設定されていない場合、1時間をデフォルトに設定
INTERVAL=${INTERVAL:-3600}

# 定期的にbundle exec rake restartを実行
while true; do
  bundle exec rake --task
  echo "Running 'bundle exec rake restart'..."
  bundle exec rake restart

  echo "Sleeping for ${INTERVAL} seconds..."
  sleep ${INTERVAL}
done
