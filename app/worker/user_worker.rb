class UserWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options :queue => :air

  #每隔五分钟执行一次
  recurrence do
    minutely(5)
  end


  def perform(*args)
    user = User.new
    puts "====#{user.inspect}"
    user.user_name = "天下第一山"
    user.user_pwd = "0101"
    user.user_session = "4396"
    user.save
  end
end