class ExperimentsController < ApplicationController
  def index
    authorize Experiment
    @experiments = Experiment.all
  end

  def show
    @experiment = Experiment.find(params[:id])
    authorize @experiment
  end

  def new
    authorize Experiment
  end

  def create
    @experiment = Experiment.new(params.permit(:name))
    authorize @experiment
    @experiment.save!
    redirect_to @experiment
  end

  def edit
    @experiment = Experiment.find(params[:id])
    authorize @experiment
  end

  def update
    @experiment = Experiment.find(params[:id])
    authorize @experiment
    @experiment.update(params[:experiment].permit(:name))
    redirect_to @experiment
  end

  def destroy
    @experiment = Experiment.find(params[:id])
    authorize @experiment
    @experiment.delete
    redirect_to root_path
  end
end
