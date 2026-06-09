class SidekiqTestController < ApplicationController
  def index
    if request.post?
      message = params[:message]
      SidekiqTestJob.perform_later(message)
      @notice = "ジョブをキューに積みました：「#{message}」"
    end
  end
end
