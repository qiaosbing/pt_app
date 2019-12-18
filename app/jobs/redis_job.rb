class RedisJob < ActiveJob::Base

  def perform(*args)
    time_beg = "20190816".to_time
    time_end = "20190816".to_time
    @top5_data_times = []
    while time_beg <= time_end
      @top5_data_times << time_beg
      time_beg = time_beg + 1.hour
    end

    Rails.logger.info "=====#{@top5_data_times.inspect}"
    @data_arr = []
    @top5_data_times.each do |time|
      datas = DData5MinYyyymm.where(:data_time => time ..time.strftime('%Y%m%d%H55'))
      @data_arr = []
      datas.each do |data|
        @data_arr << data
      end
      $redis2.hset("M", time.strftime('%Y%m%d%H'), "#{datas}")
      $redis2.expire("M",300) #设置key存在时间
    end
  end
end
