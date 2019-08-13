class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user_login

  def user_login
    Rails.logger.info "========1111111111111"
  end
end
