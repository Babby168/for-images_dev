# Sidekiq に Redisの接続先を教えるための設定ファイル。

# Sidekiq ワーカー が Redis と接続する時の設定
Sidekiq.configure_server do |config|
  # REDIS_URL 変数があればそれを使って、なければ redis://redis:6379/0 のデフォルト値を使う。
  # redis://redis:6379/0 の redis は compose.yml で定義したサービス名を使ってる。
  config.redis = { url: ENV.fetch("REDIS_URL", "redis://redis:6379/0") }
end

# Railsアプリ が Redis と接続する時の設定
Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDIS_URL", "redis://redis:6379/0") }
end
