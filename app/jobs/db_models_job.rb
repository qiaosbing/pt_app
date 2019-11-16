class DbModelsJob < ActiveJob::Base


  def perform(*args)

    User.find_each do |user|
      NewsMailer.weekly(user).deliver_now
    end
    @data_arr = []
    DStation.find_each(start: 6000) do |a|
      @data_arr << a.id
    end
    Rails.logger.info "=====#{@data_arr.inspect}"
  end
end
