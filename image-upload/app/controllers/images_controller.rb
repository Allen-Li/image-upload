class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new image_attributes
    if @image.save
      redirect_to image_path
    else
      flash[:error] =  @image.errors.messages
      render action: 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_attributes
    params.require(:image).permit(:asset, :html)
  end
end
