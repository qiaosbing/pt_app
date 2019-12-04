class UserWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  #每隔五分钟执行一次
  recurrence do
    minutely(5)
  end


  def perform(*args)
    low = LowEnforcementParameter.all
    data_time = Time.now.strftime("%Y%m%d%H%M")
    @data_arr = []
    low.each do |low|
      hash = {}
      hash[:name] = low.JCDWMC #企业名称
      hash[:frmc] = low.FRMC #负责人
      @data_arr << hash
    end
    $redis2.hset("M",data_time,"#{@data_arr}")
  end

end