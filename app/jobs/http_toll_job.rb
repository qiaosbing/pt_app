class HttpTollJob < ActiveJob::Base
  require "rest-client"

  def perform(*args)
    stationCodes = "S6403000001"
    dataTime = Time.now.strftime("Y%m%d")
    dataType = "2"
    datas = {"stationCodes": stationCodes,"dataTime":dataTime,"dataType":dataType}
    d_headers = {'Authorization': 'wuzhongYCSP 1576828704253000 d3V6aG9uZ1lDU1AxNTc2ODI4NzAzNTUxMDAw'}
    datas = RestClient.post 'http://dpt.daqi110.com/gateway/getData/air/wf/air/data/getStationData', datas.to_json, headers = d_headers
    data_arr = JSON.parse(datas.body)
    Rails.logger.info "=====#{data_arr.inspect}"


  end

end
