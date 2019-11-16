class DbMondelsJob < ActiveJob::Base


  def perform(*args)


    DStation.all.each do |a|

    end

    DStation.find_each do |a|

    end

  end
end
