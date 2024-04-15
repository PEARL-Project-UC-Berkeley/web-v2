class ControlsController < ApplicationController
  def new
    authorize Control
  end

  def create
    @control = Control.new(params[:type], params.permit(:label, :experiment_id, :min, :max, :step))
    authorize @control
    @control.save!
    redirect_to @control.experiment
  end

  def edit
    @control = Control.find(params[:id])
    authorize @control
  end

  def update
    @control = Control.find(params[:id])
    authorize @control
    @control.update(params["control_#{@control.type}"].permit(:label, :min, :max, :step, :x_min, :x_max, :x_step, :y_min, :y_max, :y_step, :z_min, :z_max, :z_step, :three_d))
    redirect_to @control.experiment
  end

  def destroy
    @control = Control.find(params[:id])
    authorize @control
    @control.delete
    redirect_to @control.experiment
  end
end
