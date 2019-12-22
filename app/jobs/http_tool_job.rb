class HttpToolJob < ActiveJob::Base


  def perform(*args)
    stationCodes = "S6403000002,S6403000003,S6403000004,S6403000007,S6403000010,S6403000012,S6403000013,S6403000014,S64030310001,S64030310002,S64030210003,S64030310005,S64030310006";
    dataTime = Time.now.strftime("Y%m%d%H")
    dataType = "1"
    datas = {"stationCodes": stationCodes,"dataTime":dataTime,"dataType":dataType}
    d_headers = {'Authorization': 'wuzhongYCSP 1577009617472000 iIw2BYUXqjuu+DLqVLTy93hzGZr9yw8g930zN5VkZyM='}
    datas = RestClient.post 'http://dpt.daqi110.com/gateway/getData/air/wf/air/data/getStationData', datas,  headers: {'Authorization': 'wuzhongYCSP 1577009617472000 iIw2BYUXqjuu+DLqVLTy93hzGZr9yw8g930zN5VkZyM='}
    Rails.logger.info "=====#{data_arr.inspect}"
  end

  end
