class CommentsController < ApplicationController
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end


  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(review_params)
    redirect_to '/pictures'
  end

  private

  def review_params
    params.require(:comment).permit(:text)
  end
end
