class HttpToolJob < ActiveJob::Base


  def perform(*args)
    datas = RestClient.get 'http://127.0.0.1:8080/data_min'
    req_data = datas.body
    Rails.logger.info "=====#{req_data.inspect}"
  end

  end
