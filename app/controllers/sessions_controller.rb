class SessionsController < ApplicationController

  def index_table

    render :partial => 'index_table', :layout => false
  end
  #用户登录页面
  def new

    render "登录成功"
  end
end
