class RedisVJob < ActiveJob::Base

  def perform(*args)
      @data_arr = []
      hash_key = $redis2.hgetall("M")
      hash_key.each do |key|
        @data_arr << $redis2.hget("M","#{key}")
      end
      Rails.logger.info "----#{@data_arr.size}"
  end

end
