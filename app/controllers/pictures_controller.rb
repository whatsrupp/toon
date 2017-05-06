class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end
  def new
    @picture = Picture.new
  end

  def create
    reviewed_params = review_params
    saved_file_name = upload
    picture = Picture.new(file_path: saved_file_name,
                          caption: reviewed_params[:caption] )
    picture.save
    redirect_to pictures_path
  end

  def upload
    uploaded_io = params[:picture][:image]
    filepath = Rails.root.join('app', 'assets', 'images','uploads', uploaded_io.original_filename)
    File.open(filepath, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    return uploaded_io.original_filename
  end

  private

  def review_params
    params.require(:picture).permit(:caption)
  end
end
