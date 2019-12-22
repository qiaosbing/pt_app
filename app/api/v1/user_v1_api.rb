class UserV1Api < Grape::API
  format :json

  params do
    requires :user_no, type: String, desc: "姓名"
  end
  #用户表
  #rails generate scaffold user_desc user_id:string user_name:string phone:string mailbox:string units:string remark:string

  post '/' do
    user_name = params[:user_no]
    Rails.logger.info "=====#{user_name.inspect}"
    return {data_arr: "滚犊子！！！！"} if !"乔帅兵".eql?(user_name)
  end


  params do
  end
  post '/data' do
    user_name = params[:params]
    return {data_err: "数据为空！"}if user_name.blank? #数据为空则返回[]
    @data_arr = []
    user_name.each do |x|
      next if !x["station_id"].present?
      hash = {}
      hash["station_id"] = x["station_id"]
      hash["data_time"] = x["data_time"]
      hash["avg_so2"] = x["so2"]
      hash["so2_label"] = x["so2_label"]
      hash["iaqi_so2"] = x["iaqi_so2"]
      hash["avg_no2"] = x["no2"]
      hash["no2_label"] = x["no2_label"]
      hash["iaqi_no2"] = x["iaqi_no2"]
      hash["avg_co"] = x["co"]
      hash["co_label"] = x["co_label"]
      hash["iaqi_co"] = x["iaqi_co"]
      hash["avg_o3"] = x["o3"]
      hash["o3_label"] = x["o3_label"]
      hash["iaqi_o3"] = x["iaqi_o3"]
      hash["avg_pm10"] = x["pm10"]
      hash["pm10_label"] = x["pm10_label"]
      hash["iaqi_ma24_pm10"] = x["iaqi_pm10"]
      hash["avg_pm25"] = x["pm25"]
      hash["pm25_label"] = x["pm25_label"]
      hash["iaqi_ma24_pm25"] = x["iaqi_pm25"]
      hash["temperature"] = x["temperature"]
      hash["temperature_label"] = x["temperature_label"]
      hash["humidity"] = x["humidity"]
      hash["humidity_label"] = x["humidity_label"]
      hash["windspeed"] = x["windspeed"]
      hash["windspeed_label"] = x["windspeed_label"]
      hash["winddirection"] = x["winddirection"]
      hash["winddirection_label"] = x["winddirection_label"]
      hash["avg_tvoc"] = x["avg_tvoc"]
      hash["tvoc_label"] = x["tvoc_label"]
      hash["aqi"] = x["aqi"]
      @data_arr << hash
    end
    return {data_err: "数据格式不正确！"} if @data_arr.blank?
    DDataHourlyYyyy.bulk_insert(update_duplicates: true) do |worker|
      @data_arr.each do |min_arr|
        worker.add(min_arr)
      end
    end
    return status = 1
  end

end


