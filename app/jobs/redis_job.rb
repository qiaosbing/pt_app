class RedisJob < ActiveJob::Base
  require "redis"

  def perform(*args)
    time_beg = "20190715".to_time
    time_end = Time.now
    while time_beg <= time_end
      data_time = time_beg + 1.day
      time_beg + 1.day
      Rails.logger.info "=3==#{time_beg}"

    end
    end
  end
