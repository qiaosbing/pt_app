class UserV1Api < Grape::API
  format :json

  params do
    requires :user_no, type: String, desc: "姓名"
  end
  #用户表
  #rails generate scaffold user_desc user_id:string user_name:string phone:string mailbox:string units:string remark:string

  post '/' do
    user_name = params[:user_no]
    Rails.logger.info "=====#{user_name.inspect}"
    return {data_arr: "滚犊子！！！！"} if !"乔帅兵".eql?(user_name)
  end


  params do
  end
  post '/data' do
    user_name = params[:params]
    user_name.each do |x|
      Rails.logger.info "===接收到的数据==#{x.inspect}"

    end

  end

end


