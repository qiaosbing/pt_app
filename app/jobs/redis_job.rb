class RedisJob < ActiveJob::Base
  require "redis"

  def perform(*args)
    low = LowEnforcementParameter.all
    data_low = low.first(10)
    data_low.each do |low|
      $redis0.select

    end
    end
  end
