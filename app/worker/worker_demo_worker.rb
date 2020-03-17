class WorkerDemoWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options :queue => :demo

  #每隔五分钟执行一次
  recurrence do
    minutely(5)
  end

  def perform(*args)

  end
end