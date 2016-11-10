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
      redirect_to image_path @image
    else
      flash[:error] =  @image.errors.messages
      render action: 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def preview_html
    image = Image.find(params[:image_id])
    image_url = image.asset.url
    image_url_el = "<img src='#{image_url}'></img>"
    html = image.html
    if html.present?
      html.gsub!('{{#content}}', image_url_el)
    else
      html = image_url_el
    end
    render html: html.html_safe
  end

  private

  def image_attributes
    params.require(:image).permit(:asset, :html)
  end
end
