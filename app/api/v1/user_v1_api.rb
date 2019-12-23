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
    return {data_err: "数据为空！"} if user_name.blank? #数据为空则返回[]
    d_station = DStation.where(:station_type => "15") #获取站点信息
    @data_arr = []
    user_name.each do |x|
      #筛选站点
      station_id = x["station_id"]
      station = d_station.select { |x| x.dz_station_id == station_id }.first
      next if !station.present? && !x["aqi"].present?


      #封装数据
      hash = {station_id:station.id.to_s,station_name:station.station_name,data_time:x["data_time"],
              avg_so2:x["so2"], so2_label:x["so2_label"],iaqi_so2:x["iaqi_so2"],
              avg_no2:x["no2"],no2_label:x["no2_label"],iaqi_no2:x["iaqi_no2"],
              avg_co:x["co"],co_label:x["co_label"],iaqi_co:x["iaqi_co"],
              avg_o3:x["o3"],o3_label:x["o3_label"],iaqi_o3:x["iaqi_o3"],
              avg_pm10:x["pm10"],pm10_label:x["pm10_label"],iaqi_ma24_pm10:x["iaqi_pm10"],
              avg_pm25:x["pm25"],pm25_label:x["pm25_label"],iaqi_ma24_pm25:x["iaqi_pm25"],
              temperature:x["temperature"],temperature_label:x["temperature_label"],
              humidity:x["humidity"],humidity_label:x["humidity_label"],
              windspeed:x["windspeed"],windspeed_label:x["windspeed_label"],
              winddirection:x["winddirection"],winddirection_label: x["winddirection_label"],
              avg_tvoc: x["avg_tvoc"],tvoc_label:x["tvoc_label"]}

      #获取aqi数据
      aqi = x["aqi"].to_s
      if aqi.present? && aqi != nil
        Rails.logger.info "=====#{aqi}"
        level = SAqiLevel.find_by_aqi(aqi)
        hash[:aqi] = aqi
        hash[:chief_pollutant] = x["chief_pollutant"] #首要污染物
        hash[:aqi_level] = level.aqi_level
        hash[:aqi_class] = level.aqi_class
        hash[:aqi_color] = level.aqi_color
      end
      #DDataHourlyYyyy.create(hash)
    end
    return status = 1
  end

end


