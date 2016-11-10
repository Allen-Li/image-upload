class TopicsController < ApplicationController
  def show
    render html: RubyChina.get_topic_page(params[:id]).html_safe
  end

  def index
    render html: RubyChina.get_topic_page().html_safe
  end

  def new
    render html: RubyChina.get_home_page('topics/new').html_safe
  end
end
