class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
    @booking = Booking.new
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experiences_params)
    if @experience.save
      redirect_to @experience, notice: "Experience added to system!"
    else
      render :new
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])


    @experience.update(experiences_params)
    redirect_to @experience, notice: "Your experience was updated!"

  end

  def destroy
    @experience = Experience.find(params[:id])

    @experience.destroy
    redirect_to experiences_path, notice: "Your experience was deleted!"
  end

  private

  def experiences_params
    params.require(:experience).permit(:name, :description, :expectation_one, :expectation_two, :expectation_three, :notice, photos: [])

  end


end
