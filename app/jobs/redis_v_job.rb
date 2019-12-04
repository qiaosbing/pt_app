class RedisVJob < ActiveJob::Base

  def perform(*args)
    # @data_arr = []
    # hash_key = $redis2.hgetall("M")
    # hash_key.each do |key|
    #   @data_arr << $redis2.hget("M","#{key}")
    # end
    # Rails.logger.info "----#{@data_arr.size}"
    data = DData5MinYyyymm.where(:data_time => "201928150000".."201928210000")
    Rails.logger.info "====#{data.size}"
  end

end
