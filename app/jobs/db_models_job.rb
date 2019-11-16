class DbModelsJob < ActiveJob::Base


  def perform(*args)

    @data_arr = []
    DStation.find_each(start: 6000) do |a|
      @data_arr << a.id
    end
    Rails.logger.info "=====#{@data_arr.inspect}"
  end
end
