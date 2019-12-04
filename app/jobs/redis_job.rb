class RedisJob < ActiveJob::Base
  require "redis"

  def perform(*args)
    time_beg = "20190715".to_time
    time_end = Time.now
    @top5_data_times = []
    while time_beg <= time_end
      Rails.logger.info "=====#{time_beg.strftime('%Y-%m-%d %H:00:00')}"
      @top5_data_times << time_beg.strftime('%Y-%m-%d %H:00:00')
      time_beg = time_beg + 1.day
    end
  end
end
