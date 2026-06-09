# Sidekiq 検証用ジョブの作成
class SidekiqTestJob < ApplicationJob
  queue_as :default

  def perform(message)
    Rails.logger.info "=== SidekiqTestJob 実行 ==="
    Rails.logger.info "受け取ったメッセージ: #{message}"
    Rails.logger.info "実行時刻: #{Time.current}"
    Rails.logger.info "==========================="
  end
end
