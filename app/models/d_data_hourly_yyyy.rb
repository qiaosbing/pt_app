class DDataHourlyYyyy < ApplicationRecord
  self.primary_key  = "id"
  belongs_to :d_station, :foreign_key => :station_id

  # 按time查询
  scope :s_by_one_time, ->(time_one) {

    where(:data_time => time_one) if time_one.present?
  }
  # 时间段查询
  scope :s_by_time, ->(time_one, time_two) {

    where(:data_time => time_one..time_two) if time_one.present?
  }
  # 按id查询
  scope :s_by_id, ->(station_ids) {
    where(:station_id => station_ids) if station_ids.present?
  }
  # 按因子排名 qiaosbing 2019-07-26  修改：中牟用户下，不根据因子排序查询的报表数据为正序
  scope :by_item_sort, ->(zm_region_name,item_name, sort_code) {
    if item_name.present?
      order(item_name => sort_code)  if item_name.present?
    else
      order(:data_time => :DESC) if zm_region_name == ""
    end
  }
  scope :find_by_start_end_time, ->(start_datetime,end_datetime){
    where( :data_time =>  start_datetime.strftime("%Y%m%d%H")..end_datetime.strftime("%Y%m%d%H") ) if start_datetime.present? & end_datetime.present?
  }

  #app首页使用数据 小时数据无ma8_o3 ，只有天数据有
  def self.county_hour_data(d_data, region_code, data_time)
    # ### 初始化
    item = Hash.new
    if d_data
      if region_code.nil?
        item[:region_name] = "平均值"
        item[:region_code] = "平均值"
      else
        item[:region_name] = region_code.region_name
        item[:region_code] = region_code.region_code
      end
      # item[:k]=[]
      item[:data_time] = data_time
      item["avg_so2"] = (d_data.map {|x| x["avg_so2"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["avg_so2"].to_f}.sum/d_data.map {|x| x["avg_so2"]}.compact.length, 0) : 0
      item["avg_no2"] = (d_data.map {|x| x["avg_no2"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["avg_no2"].to_f}.sum/d_data.map {|x| x["avg_no2"]}.compact.length, 0) : 0
      item["avg_pm10"] = (d_data.map {|x| x["avg_pm10"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["avg_pm10"].to_f}.sum/d_data.map {|x| x["avg_pm10"]}.compact.length, 0) : 0
      item["avg_co"] = (d_data.map {|x| x["avg_co"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["avg_co"].to_f}.sum/d_data.map {|x| x["avg_co"]}.compact.length, 1) : 0
      item["avg_o3"] = (d_data.map {|x| x["avg_o3"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["avg_o3"].to_f}.sum/d_data.map {|x| x["avg_o3"]}.compact.length, 0) : 0
      item["ma8_o3"] = (d_data.map {|x| x["ma8_o3"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["ma8_o3"].to_f}.sum/d_data.map {|x| x["ma8_o3"]}.compact.length, 0) : 0
      item["avg_pm25"] = (d_data.map {|x| x["avg_pm25"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["avg_pm25"].to_f}.sum/d_data.map {|x| x["avg_pm25"]}.compact.length, 0) : 0
      item[:so2_label] = "-"
      item[:no2_label] = "-"
      item[:co_label] = "-"
      item[:o3_label] = "-"
      item[:pm10_label] = "-"
      item[:pm25_label] = "-"
      ### 计算分指数
      item[:iaqi_so2] = SIaqiLimit.smooth_iaqi("ma24_so2", item["avg_so2"])
      item[:iaqi_no2] = SIaqiLimit.smooth_iaqi("ma24_no2", item["avg_no2"])
      item[:iaqi_co] = SIaqiLimit.smooth_iaqi("ma24_co", item["avg_co"])
      item[:iaqi_o3] = SIaqiLimit.smooth_iaqi("o3", item["avg_o3"])
      item[:iaqi_ma8_o3] = SIaqiLimit.smooth_iaqi("ma8_o3", item["ma8_o3"])
      item[:iaqi_ma24_pm25] = SIaqiLimit.smooth_iaqi("ma24_pm25", item["avg_pm25"])
      item[:iaqi_ma24_pm10] = SIaqiLimit.smooth_iaqi("ma24_pm10", item["avg_pm10"])
      # 小时数据无ma8_o3 ，只有天数据有 gxh 2019-8-23
      #aqi = [item[:iaqi_so2].to_i, item[:iaqi_no2].to_i, item[:iaqi_co].to_f, item[:iaqi_o3].to_i, item[:iaqi_ma24_pm25].to_i, item[:iaqi_ma24_pm10].to_i, item[:iaqi_ma8_o3].to_i]
      #aqi_level = ["SO2", "NO2", "CO", "O3", "PM2.5", "PM10", "O3-8H"]
      aqi = [item[:iaqi_so2].to_i, item[:iaqi_no2].to_i, item[:iaqi_co].to_f, item[:iaqi_o3].to_i, item[:iaqi_ma24_pm25].to_i, item[:iaqi_ma24_pm10].to_i]
      aqi_level = ["SO2", "NO2", "CO", "O3", "PM2.5", "PM10"]
      if aqi.max == 0
        item[:aqi] = 0
      else
        item[:aqi] = aqi.max
      end
      if d_data.length > 0
        item[:chief_pollutant] = aqi.max <= 50 ? "--" : aqi_level[aqi.index(aqi.max)]
        item[:aqi_level] = SAqiLevel.find_by_aqi(aqi.max).aqi_level
        item[:aqi_class] = SAqiLevel.find_by_aqi(aqi.max).aqi_class
        item[:aqi_color] = SAqiLevel.find_by_aqi(aqi.max).aqi_color
      else
        item[:chief_pollutant] = "-"
        item[:aqi_level] = "-"
        item[:aqi_class] = "-"
        item[:aqi_color] = "-"
      end
    else
      item[:region_name] = "-"
      item[:region_code] = "-"
      item[:data_time] = "-"
      item["avg_so2"] = 0
      item["avg_no2"] = 0
      item["avg_pm10"] = 0
      item["avg_co"] = 0
      item["avg_o3"] = 0
      item["ma8_o3"] = 0
      item["avg_pm25"] = 0
      item[:so2_label] = "-"
      item[:no2_label] = "-"
      item[:co_label] = "-"
      item[:o3_label] = "-"
      item[:pm10_label] = "-"
      item[:pm25_label] = "-"
      item[:iaqi_so2] = "-"
      item[:iaqi_no2] = "-"
      item[:iaqi_co] = "-"
      item[:iaqi_o3] = "-"
      item[:iaqi_ma8_o3] = "-"
      item[:iaqi_ma24_pm25] = "-"
      item[:iaqi_ma24_pm10] = "-"
      item[:aqi] = 0
      item[:chief_pollutant] = "-"
      item[:aqi_level] = "-"
      item[:aqi_class] = "-"
      item[:aqi_color] = "-"
    end
    return item
  end

  #小时数据
  def self.hour_data(d_data, id, data_time)
    item = Hash.new
    if d_data == "" || d_data.nil?
      item[:station_name] = ""
      if id.present?
        item[:station_name] = DStation.find_by_id(id).station_name
        item[:station_id] = id.id
        if (SStationType.find_by_station_type(DStation.find_by_id(id).station_type).station_type).to_i == 7
          item[:station_type] = "6"
        else
          item[:station_type] = SStationType.find_by_station_type(DStation.find_by_id(id).station_type).station_type
        end
        item[:type_name] = SStationType.find_by_station_type(DStation.find_by_id(id).station_type).type_name
        item[:is_online] = DStation.find_by_id(id).is_online
        item[:longitude] = DStation.find_by_id(id).longitude
        item[:latitude] = DStation.find_by_id(id).latitude
        item[:station_location] = DStation.find_by_id(id).station_location
      end
      item[:data_time] = data_time
      item["avg_so2"] = ""
      item["iaqi_so2"] = ""
      item["so2_label"] = ""
      item["avg_no2"] = ""
      item["iaqi_no2"] = ""
      item["no2_label"] = ""
      item["avg_co"] = ""
      item["iaqi_co"] = ""
      item["co_label"] = ""
      item["avg_o3"] = ""
      item["iaqi_o3"] = ""
      item["o3_label"] = ""
      item["avg_pm10"] = ""
      item["iaqi_avg_pm10"]= ""
      item["pm10_label"] = ""
      item["avg_pm25"] = ""
      item["iaqi_avg_pm25"]= ""
      item["pm25_label"] = ""
      item[:aqi] = ""
      item[:chief_pollutant] = ""
      item[:aqi_level] = ""
      item[:aqi_class] = ""
      item[:aqi_color] = ""
    elsif d_data
      item[:station_name] = d_data.station_name
      if id.present?
        item[:station_id] = id
        if (SStationType.find_by_station_type(DStation.find_by_id(id).station_type).station_type).to_i == 7
          item[:station_type] = "6"
        else
          item[:station_type] = SStationType.find_by_station_type(DStation.find_by_id(id).station_type).station_type
        end
        item[:type_name] = SStationType.find_by_station_type(DStation.find_by_id(id).station_type).type_name
        item[:is_online] = DStation.find_by_id(id).is_online
        item[:longitude] = DStation.find_by_id(id).longitude
        item[:latitude] = DStation.find_by_id(id).latitude
        item[:station_location] = DStation.find_by_id(id).station_location
      end
      item[:data_time] = data_time
      item["avg_so2"] = d_data.avg_so2.present? ? d_data.avg_so2 : ""
      item["iaqi_so2"] = d_data.iaqi_so2.present? ? d_data.iaqi_so2 : ""
      item["so2_label"] = d_data.so2_label.present? ? d_data.so2_label : ""
      item["avg_no2"] = d_data.avg_no2.present? ? d_data.avg_no2 : ""
      item["iaqi_no2"] = d_data.iaqi_no2.present? ? d_data.iaqi_no2 : ""
      item["no2_label"] = d_data.no2_label.present? ? d_data.no2_label : ""
      item["avg_co"] = d_data.avg_co.present? ? d_data.avg_co : ""
      item["iaqi_co"] = d_data.iaqi_co.present? ? d_data.iaqi_co : ""
      item["co_label"] = d_data.co_label.present? ? d_data.co_label : ""
      item["avg_o3"] = d_data.avg_o3.present? ? d_data.avg_o3 : ""
      item["iaqi_o3"] = d_data.iaqi_o3.present? ? d_data.iaqi_o3 : ""
      item["o3_label"] = d_data.o3_label.present? ? d_data.o3_label : ""
      item["avg_pm10"] = d_data.avg_pm10.present? ? d_data.avg_pm10 : ""
      item["iaqi_avg_pm10"]= d_data.iaqi_ma24_pm10.present? ? d_data.iaqi_ma24_pm10 : ""
      item["pm10_label"] = d_data.pm10_label.present? ? d_data.pm10_label : ""
      item["avg_pm25"] = d_data.avg_pm25.present? ? d_data.avg_pm25 : ""
      item["iaqi_avg_pm25"]= d_data.iaqi_ma24_pm25.present? ? d_data.iaqi_ma24_pm25 : ""
      item["pm25_label"] = d_data.pm25_label.present? ? d_data.pm25_label : ""
      item[:aqi] = d_data.aqi.present? ? d_data.aqi : ""
      item[:chief_pollutant] = d_data.chief_pollutant.present? ? d_data.chief_pollutant : ""
      item[:aqi_level] = d_data.aqi_level.present? ? d_data.aqi_level : ""
      item[:aqi_class] = d_data.aqi_class.present? ? d_data.aqi_class : ""
      item[:aqi_color] = d_data.aqi_color.present? ? d_data.aqi_color : ""
    end
    return item
  end



end
