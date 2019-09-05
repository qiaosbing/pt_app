class UserV1Api < Grape::API
  format :json

  params do
    requires :user_no, type: String, desc: "姓名"
  end
  #用户表
  #rails generate scaffold user_desc user_id:string user_name:string phone:string mailbox:string units:string remark:string

  post '/' do
    user_name = params[:user_no]
    return {data_arr: "滚犊子！！！！"} if !"乔帅兵".eql?(user_name)

    data_user = UserDesc.find_by(:user_name => user_name)
    hash = {}
    hash[:user_name] = data_user.user_name
    hash[:phone] = data_user.phone
    hash[:mailbox] = data_user.mailbox
    hash[:units] = data_user.units
    hash[:remark] = data_user.remark

    return hash
  end


  params do
  end
  get '/' do
    data = $redis.get("hash");
    datas = eval(data)
    Rails.logger.info "==接收到的数据===#{datas.inspect}"
    datas = datas["hash"]
    datas.each do |da|
      Rails.logger.info "==循环数据===#{da.inspect}"
    end

  end

end


