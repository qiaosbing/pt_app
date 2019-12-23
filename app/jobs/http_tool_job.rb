class HttpToolJob < ActiveJob::Base


  def perform(*args)
    datas = RestClient.get 'http://106.54.8.7:8080/data_hour'
    req_data = JSON.parse(datas.body)

    Rails.logger.info "=====#{req_data.inspect}"
  end
  end
