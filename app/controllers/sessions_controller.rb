class SessionsController < ApplicationController

  def index_table
    user = params[:user]
    pwd = params[:pwd]
    Rails.logger.info "===index_table==用户===#{user}=====密码==#{pwd}"

    render :partial => 'index_table', :layout => false
  end
  #用户登录页面
  def new
    user = params[:user]
    pwd = params[:pwd]
    Rails.logger.info "==new===用户===#{user}=====密码==#{pwd}"
    # render json: {data:"SUCCESS"}, status: :ok, layout: false

    #render "SUCCESS"
  end
end
