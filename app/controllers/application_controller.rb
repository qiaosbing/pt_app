class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user_login

  def user_login
  end
end
