class RedisJob < ActiveJob::Base
  require "redis"

  def perform(*args)
    low = LowEnforcementParameter.all
    data_time = Time.now.strftime("'%Y%m%d%H'")
    data_low = low.first(10)
    @data_arr = []
    data_low.each do |low|
      hash = {}
      hash[:name] = low.JCDWMC #企业名称
      hash[:name] = low.FRMC #负责人
      @data_arr << hash
    end
    $redis0.set(data_time,@data_arr.to_s)
    end
  end
