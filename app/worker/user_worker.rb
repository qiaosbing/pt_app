class UserWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  #每隔五分钟执行一次
  recurrence do
    minutely(5)
  end

  def perform(*args)
    SocketPustJob.perform_now()
  end
end