class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @experiences = policy_scope(Experience).order(created_at: :desc)
  end

  def show
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(experiences_params)
    authorize @experience
    if @experience.save
      redirect_to @experience, notice: "Experience added to system!"
    else
      render :new
    end
  end

  def edit
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.update(experiences_params)
    authorize @experience
    redirect_to @experience, notice: "Your experience was updated!"

  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    authorize @experience
    redirect_to experiences_path, notice: "Your experience was deleted!"
  end


  private

  def experiences_params
    params.require(:experience).permit(:name, :description, :expectation_one, :expectation_two, :expectation_three, :notice, photos: [])

  end


end
