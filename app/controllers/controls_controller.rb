class ControlsController < ApplicationController
  def new
    authorize Control
  end

  def create
    puts params
    @control = Control.new(params[:type], params.permit(:label, :experiment_id))
    authorize @control
    @control.save!
    redirect_to @control.experiment
  end

  def edit
    @control = Experiment.find(params[:id])
    authorize @control
  end

  def update
    @control = Experiment.find(params[:id])
    authorize @control
    @control.update(params[:control].permit(:name))
    redirect_to @control.experiment
  end

  def destroy
    @control = Control.find(params[:type], params[:id])
    authorize @control
    @control.delete
    redirect_to @control.experiment
  end
end
