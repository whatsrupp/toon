class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end
  def new
    @picture = Picture.new
  end

  # def create
  #
  #   picture = Picture.new(user_params)
  #   picture.save
  #   redirect_to pictures_path
  # end


  def show
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(picture_params)
    require 'pry'; binding.pry
    if @picture.save
      redirect_to pictures_path
    else
      render action: 'new'
    end
  end
  private


  private

  def picture_params
    params.require(:picture).permit(:thumbnail, :caption)
  end


  def review_params
    params.require(:picture).permit(:caption)
  end

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:picture).permit(:thumbnail, :caption)
  end
end
