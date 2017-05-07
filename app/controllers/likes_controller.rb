class LikesController < ApplicationController

  def create
  end

  def new
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    redirect_to 'restaurant'
  end


end
