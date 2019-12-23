class WzLkjhWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  #每隔五分钟执行一次
  recurrence do
    hourly.minute_of_hour(25)
  end

  def perform(*args)
    HttpToolJob.perform_now()
  end
end