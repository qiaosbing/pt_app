class RedisJob < ActiveJob::Base

  def perform(*args)
    $redis.set()
  end
end
