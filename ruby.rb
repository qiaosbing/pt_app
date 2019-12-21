require "rest-client"

class Ruby
  def self.start
    stationCodes = "S6403000001"
    dataTime = Time.now.strftime("%Y%m%d%H")
    dataType = "1"
    Rails.logger.info "====测试"
    datas = {"stationCodes": stationCodes, "dataTime": dataTime, "dataType": dataType}
    d_headers = {'Authorization': 'wuzhongYCSP 1576838081233000 rtdJyy5gRaHFVHmwRMKfxg/Ec4b8PDV+gvCCb+kr0Y8='}
    datas = RestClient.post 'http://dpt.daqi110.com/gateway/getData/air/wf/air/data/getStationData', datas, headers = d_headers
    data_arr = JSON.parse(datas.body)
    Rails.logger.info "=====#{data_arr.inspect}"
  end
end


