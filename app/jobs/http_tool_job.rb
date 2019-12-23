class HttpToolJob < ActiveJob::Base


  def perform(*args)
    datas = RestClient.post 'http://106.54.8.7:8080/data_hour'
    req_data = datas.body
    Rails.logger.info "=====#{req_data.inspect}"

  end

  end
