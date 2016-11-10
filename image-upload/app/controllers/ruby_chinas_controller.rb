class RubyChinasController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render html: RubyChina.get_home_page.html_safe
  end

  def user
    render html: RubyChina.get_home_page(params[:user_id]).html_safe
  end

  def sign_in
    if request.get?
      render html: RubyChina.get_home_page('account/sign_in').html_safe
    elsif request.post?
      binding.pry
    end
  end

  def sign_in_post
    url = "https://ruby-china.org"
    password = params[:password]
    login = params[:login]
    remember_me = params[:remember_me]
    html = RubyChina.sign_in(url, password, login, remember_me)
    render html: html.html_safe
  end

  def transfer
    render html: RubyChina.get_home_page(params[:path]).html_safe
  end
end
