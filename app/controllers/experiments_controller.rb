class ExperimentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
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
    @experiment = Experiment.new(params[:experiment].permit(:name, :description))
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
    @experiment.update(params[:experiment].permit(:name, :description))
    redirect_to @experiment
  end

  def destroy
    @experiment = Experiment.find(params[:id])
    authorize @experiment
    @experiment.controls.map { | c | c.delete }
    @experiment.delete
    redirect_to root_path
  end
end
