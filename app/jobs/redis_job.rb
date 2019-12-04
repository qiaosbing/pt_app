class RedisJob < ActiveJob::Base
  require "redis"

  def perform(*args)
    time_beg = "20190715".to_time
    time_end = Time.now
    time_1 =  time_beg.strftime('%Y%m%d')
    time_2 =  time_end.strftime('%Y%m%d')
    Rails.logger.info "==0=#{time_1}"
    Rails.logger.info "==1=#{time_2}"



    day =  time_2.to_i - time_1.to_i
    Rails.logger.info "=3==#{day}"
    end
  end
