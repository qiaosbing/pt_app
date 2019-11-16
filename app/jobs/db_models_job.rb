class DbModelsJob < ActiveJob::Base


  def perform(*args)

    #
    # DStation.all.each do |a|
    #
    # end

    DStation.find_each do |a|
      Rails.logger.info "=============#{a.inspect}"

    end

  end
end
