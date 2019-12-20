class HttpTollJob < ActiveJob::Base
  require "rest-client"

  def perform(*args)
    stationCodes = "S6403000001"
    dataTime = Time.now.strftime("Y%m%d")
    dataType = "2"
    datas = {"stationCodes": stationCodes,"dataTime":dataTime,"dataType":dataType}
    d_headers = {'Authorization': 'wuzhongYCSP 1576835818353000 ttN9KaRLVF9vtvE8chXBXK+ni8bfJRztVadUzs9JpcA='}
    datas = RestClient.post 'http://dpt.daqi110.com/gateway/getData/air/wf/air/data/getStationData', datas, headers = d_headers
    data_arr = JSON.parse(datas.body)
    Rails.logger.info "=====#{data_arr.inspect}"


  end

end
