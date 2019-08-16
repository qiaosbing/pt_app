class SessionsController < ApplicationController

  def index_tbale

    render :partial => 'index_table', :layout => false
  end
  #用户登录页面
  def new

  end
end
