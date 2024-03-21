class ExperimentChannel < ApplicationCable::Channel
  def subscribed
    puts current_user
    stream_from "experiment_#{params[:experiment]}"
  end
  
  def receive(data)
    ActionCable.server.broadcast("experiment_#{params[:experiment]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
