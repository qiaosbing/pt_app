class RedisVJob < ActiveJob::Base

  def perform(*args)
    @data_arr = []
    hash_key = $redis2.hgetall("M")
    hash_key.each do |key|
      datas = $redis2.hget("M","#{key}")
      data = eval(datas)
      s_data = data.first(5)
      Rails.logger.info "----#{s_data.inspect}"

    end
  end

end
