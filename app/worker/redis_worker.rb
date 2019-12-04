class UserWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  #每隔五分钟执行一次
  recurrence do
    minutely(5)
  end


  def perform(*args)
    time_beg = "20190715".to_time
    time_end = Time.now
    time_1 =  time_beg.strftime('%Y%m%d%H')
    time_2 =  time_end.strftime('%Y%m%d%H')

    day =  time_2.to_i - time_1.to_i
    Rails.logger.info "===#{day}"

      # low_min = DData5MinYyyymm.all
    # low_min.select {|x|}
    # @data_arr = []
    # low.each do |low|
    #   hash = {}
    #   hash[:name] = low.JCDWMC #企业名称
    #   hash[:frmc] = low.FRMC #负责人
    #   @data_arr << hash
    # end
    # $redis2.hset("M",data_time,"#{@data_arr}")
  end

end