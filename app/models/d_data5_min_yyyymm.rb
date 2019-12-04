class DData5MinYyyymm < ApplicationRecord
  belongs_to :d_station, :foreign_key => :station_id

  scope :find_by_station_ids, ->(ids){
    where( "station_id" => ids.split(",") ) if ids.to_i > 0
  }

  scope :find_station_ids, ->(ids){
    where( "station_id" => ids ) if ids.present?
  }

  scope :find_by_item_code,->(item_code_str) do
    where(:item_code => item_code_str) if item_code_str.present?
  end

  scope :find_by_start_end_time, ->(start_datetime,end_datetime){
    where( :data_time =>  start_datetime.strftime("%Y%m%d%H%M")..end_datetime.strftime("%Y%m%d%H%M") ) if start_datetime.present? & end_datetime.present?
  }
  scope :find_by_one_time, ->(data_time){
    where( :data_time =>  data_time) if data_time.present?
  }

  #区域数据
  def self.county_min_data(d_data, region_code, data_time)
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
      item[:data_time] = Time.parse(data_time).strftime("%H:%M")
      item["so2"] = (d_data.map {|x| x["so2"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["so2"].to_f}.sum/d_data.length, 0) : 0
      item["no2"] = (d_data.map {|x| x["no2"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["no2"].to_f}.sum/d_data.length, 0) : 0
      item["pm10"] = (d_data.map {|x| x["pm10"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["pm10"].to_f}.sum/d_data.length, 0) : 0
      item["co"] = (d_data.map {|x| x["co"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["co"].to_f}.sum/d_data.length, 1) : 0
      item["o3"] = (d_data.map {|x| x["o3"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["o3"].to_f}.sum/d_data.length, 0) : 0
      item["pm25"] = (d_data.map {|x| x["pm25"]}.compact)[0].present? ? DataRepairedHelper.data_repaired(d_data.map {|x| x["pm25"].to_f}.sum/d_data.length, 0) : 0
      # if item[:k].uniq[0] == 0
      #   item["is_ok"] = "NO"
      # else
      #   item["is_ok"] = "YES"
      # end
      item[:so2_label] = "-"
      item[:no2_label] = "-"
      item[:co_label] = "-"
      item[:o3_label] = "-"
      item[:pm10_label] = "-"
      item[:pm25_label] = "-"
    else
      item[:region_name] = "-"
      item[:region_code] = "-"
      item[:data_time] = "-"
      item["so2"] = 0
      item["no2"] = 0
      item["pm10"] = 0
      item["co"] = 0
      item["o3"] = 0
      item["pm25"] = 0
      item[:so2_label] = "-"
      item[:no2_label] = "-"
      item[:co_label] = "-"
      item[:o3_label] = "-"
      item[:pm10_label] = "-"
      item[:pm25_label] = "-"
      item[:iaqi_scolor] = "-"
      # item[:k] = [0,0,0,0,0,0]
    end
    return item
  end


  def self.min_data(d_data, id, data_time)
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
      item["so2"] = ""
      item[:so2_label] = ""
      item["no2"] = ""
      item[:no2_label] = ""
      item["co"] = ""
      item[:co_label] = ""
      item["o3"] = ""
      item[:o3_label] = ""
      item["pm10"] = ""
      item[:pm10_label] = ""
      item["pm25"] = ""
      item[:pm25_label] = ""
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
      item["so2"] = d_data.so2.present? ? d_data.so2 : ""
      item[:so2_label] = d_data.so2_label.present? ? d_data.so2_label : ""
      item["no2"] = d_data.no2.present? ? d_data.no2 : ""
      item[:no2_label] = d_data.no2_label.present? ? d_data.no2_label : ""
      item["co"] = d_data.co.present? ? d_data.co : ""
      item[:co_label] = d_data.co_label.present? ? d_data.co_label : ""
      item["o3"] = d_data.o3.present? ? d_data.o3 : ""
      item[:o3_label] = d_data.o3_label.present? ? d_data.o3_label : ""
      item["pm10"] = d_data.pm10.present? ? d_data.pm10 : ""
      item[:pm10_label] = d_data.pm10_label.present? ? d_data.pm10_label : ""
      item["pm25"] = d_data.pm25.present? ? d_data.pm25 : ""
      item[:pm25_label] = d_data.pm25_label.present? ? d_data.pm25_label : ""
    end
    return item
  end

end
