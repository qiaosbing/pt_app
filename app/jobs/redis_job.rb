class RedisJob < ActiveJob::Base
  require "redis"

  def perform(*args)
    time_beg = "20190801".to_time
    time_end = "20190802".to_time
    @top5_data_times = []
    while time_beg <= time_end
      @top5_data_times << time_beg
      time_beg = time_beg + 1.day
    end

    @data_arr = []
    @top5_data_times.each do |time|
      s_brg = time.beginning_of_day #今天的开始时间
      s_end = time.at_end_of_day #今天的结束时间
      datas = DData5MinYyyymm.where(:data_time => s_brg.strftime('%Y%m%d%H%M')..s_end.strftime('%Y%m%d%H%M'))
      $redis2.hset("M", time.strftime('%Y%m%d'), "#{datas}")
    end
  end
end
