class UserV1Api < Grape::API
  format :json

  params do
    requires :user_no, type: String, desc: "用户名"
    requires :user_pwd, type: String, desc: "密码"
  end
  #用户表
  #rails generate scaffold user_desc user_id:string user_name:string phone:string mailbox:string units:string remark:string

  post '/' do
    user_name = params[:user_no]
    user_pwd = params[:user_pwd]
    return {data_arr: "滚犊子！！！！"} if !user_name.present? || !user_pwd.present?

    #data_user = User.find_by("user_name = #{user_name} and user_pwd = #{user_pwd}")
  end


  params do
  end
  get '/' do
    data = $redis.get("hash");
    datas = eval(data)
    datas = datas["hash"]
    datas.each do |da|
    end
  end

end


