class UserV1Api < Grape::API
  format :json

  params do
    requires :user_no, type: String, desc: "用户名"
    requires :user_pw, type: String, desc: "用户密码"
  end
  post '/' do
    return {data:"滚！！！！"}
  end
end