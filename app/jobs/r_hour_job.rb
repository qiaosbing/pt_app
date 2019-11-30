class RHourjob < ActiveJob::Base
  def perform(*args)
    user = User.new
    user.user_name = "天下第一山"
    user.user_pwd = "0101"
    user.user_session = "4396"
    user.user_desc = "软件测试！"
    user.save
  end

  end
