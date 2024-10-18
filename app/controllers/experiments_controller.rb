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
    @experiment = Experiment.new(experiment_params)
    authorize @experiment

    unless params[:experiment][:image].present?
      @experiment.image.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'physics_image.jpg')),
        filename: 'default_image.jpg',
        content_type: 'image/jpeg'
      )
    end

    if @experiment.save
      redirect_to @experiment, notice: 'Experiment was successfully created.'
    else
      render :new
    end
  end

  def edit
    @experiment = Experiment.find(params[:id])
    authorize @experiment
  end

  def update
    @experiment = Experiment.find(params[:id])
    authorize @experiment
    if @experiment.update(experiment_params)
      redirect_to @experiment, notice: 'Experiment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @experiment = Experiment.find(params[:id])
    authorize @experiment
    @experiment.controls.map { | c | c.delete }
    @experiment.delete
    redirect_to root_path
  end

  private

  def experiment_params
    params.require(:experiment).permit(:name, :description, :image)
  end
end
