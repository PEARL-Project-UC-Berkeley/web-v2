class ComponentsController < ApplicationController
  def new
    authorize Component
  end

  def create
    @component = Component.new(params[:type], params.permit(:label, :experiment_id))
    authorize @component
    @component.save!
    redirect_to @component.experiment
  end

  def edit
    @component = Component.find(params[:id])
    authorize @component
  end

  def update
    @component = Component.find(params[:id])
    authorize @component
    @component.update(params["component_#{@component.type}"].permit(:label))
    redirect_to @component.experiment
  end

  def destroy
    @component = Component.find(params[:id])
    authorize @component
    @component.delete
    redirect_to @component.experiment
  end
end
