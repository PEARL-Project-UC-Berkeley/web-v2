class CameraStreamsController < ApplicationController
  def new
    authorize CameraStream
  end

  def create
    @camera_stream = CameraStream.new(params["camera_stream"].permit(:url).merge(params.permit(:experiment_id)))
    authorize @camera_stream
    @camera_stream.save!
    redirect_to @camera_stream.experiment
  end

  def edit
    @camera_stream = CameraStream.find(params[:id])
    authorize @camera_stream
  end

  def update
    @camera_stream = CameraStream.find(params[:id])
    authorize @camera_stream
    @camera_stream.update(params["camera_stream"].permit(:url, :experiment_id))
    redirect_to @camera_stream.experiment
  end

  def destroy
    @camera_stream = CameraStream.find(params[:id])
    authorize @camera_stream
    @camera_stream.delete
    redirect_to @camera_stream.experiment
  end
end
