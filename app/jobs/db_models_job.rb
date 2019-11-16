class DbModelsJob < ActiveJob::Base


  def perform(*args)

    #
    # DStation.all.each do |a|
    #
    # end

    DStation.find_each(batch_size:1000) do |a|

    end

  end
end
