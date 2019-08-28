module ExecHelper
  #qiaosbing 2019.8.20 导入日报表格数据，生成日  报
  # ExecHelper.zm_read()
  def self.zm_read()
    Spreadsheet.client_encoding = "UTF-8"
    book = Spreadsheet.open "#{Rails.root}/public/yuanshi.xls"
    sheet1 = book.worksheet 1
    day_data = []
    sheet1.each do |row|
      if row[3].include? "日"
        time = (row[3].to_s).delete("年月日") #删除年月日
        data_time = Time.parse(time).strftime("%Y%m%d")
      else
        data_time = Time.parse(row[3].to_s).strftime("%Y%m%d%H")
      end
      Rails.logger.info "=======#{row[2]}"
      Rails.logger.info "====时间===#{data_time}"
      Rails.logger.info "=======#{row[4]}"
      Rails.logger.info "=======#{row[5]}"
      Rails.logger.info "=======#{row[6]}"
      Rails.logger.info "=======#{row[7]}"
      Rails.logger.info "=======#{row[8]}"
      Rails.logger.info "=======#{row[9]}"
      Rails.logger.info "=======#{row[10]}"
      Rails.logger.info "=======#{row[11]}"

      #
      #
      #   avg_so2 = row[1] == "-" ? nil : row[1]
      #   avg_no2 = row[2] == "-" ? nil : row[2]
      #   avg_pm10 = row[3] == "-" ? nil : row[3]
      #   avg_co = row[4] == "-" ? nil : row[4]
      #   max_ma8_o3 = row[5] == "-" ? nil : row[5]
      #   avg_pm25 = row[6] == "-" ? nil : row[6]
      #   aqi = row[7] == "-" ? nil : row[7]
      #   chief_pollutant = row[8] #首要污染物
      #   aqi_color = SAqiLevel.find_by_aqi(aqi).aqi_color
      #   if row[9] == "I" #污染等级
      #     aqi_level = "一级"
      #     aqi_class = "优"
      #   elsif row[9] == "II"
      #     aqi_level = "二级"
      #     aqi_class = "良"
      #   elsif row[9] == "III"
      #     aqi_level = "三级"
      #     aqi_class = "轻度污染"
      #   elsif row[9] == "IV"
      #     aqi_level = "四级"
      #     aqi_class = "中度污染"
      #   elsif row[9] == "V"
      #     aqi_level = "五级"
      #     aqi_class = "重度污染"
      #   end
      #   station_id = row[11]  #站点ID
      #   station_name = row[12] #站点名称
      #
      #   #转换因子值，因子从表格中获取的因子为字符串
      #   aqi_so2 = avg_so2.to_i
      #   aqi_no2 = avg_no2.to_i
      #   aqi_co = avg_co.to_i
      #   aqi_ma8_o3 = max_ma8_o3.to_i
      #   aqi_pm10 = avg_pm10.to_i
      #   aqi_pm25 = avg_pm25.to_i
      #
      #   #### iaqi 空气质量分指数
      #   iaqi_so2 = SIaqiLimit.smooth_iaqi("ma24_so2", aqi_so2)
      #   iaqi_no2 = SIaqiLimit.smooth_iaqi("ma24_no2", aqi_no2)
      #   iaqi_co = SIaqiLimit.smooth_iaqi("ma24_co", aqi_co)
      #   iaqi_ma8_o3 = SIaqiLimit.smooth_iaqi("o3", aqi_ma8_o3)
      #   iaqi_pm10 = SIaqiLimit.smooth_iaqi("ma24_pm10", aqi_pm10)
      #   iaqi_pm25 = SIaqiLimit.smooth_iaqi("ma24_pm25", aqi_pm25)
      #
      #   #封装数据
      #   day_data << {station_id: station_id, station_name: station_name, data_time: data_time,
      #                avg_so2: avg_so2, iaqi_so2: iaqi_so2.to_i, avg_no2: avg_no2, iaqi_no2: iaqi_no2.to_i,
      #                avg_co: avg_co, iaqi_co: iaqi_co.to_i, max_ma8_o3: max_ma8_o3, iaqi_ma8_o3: iaqi_ma8_o3.to_i,
      #                avg_pm10: avg_pm10, iaqi_pm10: iaqi_pm10.to_i, avg_pm25: avg_pm25,
      #                iaqi_pm25: iaqi_pm25.to_i, aqi: aqi.to_i, aqi_level: aqi_level, aqi_class: aqi_class,
      #                aqi_color: aqi_color, chief_pollutant: chief_pollutant, so2_label: data_s(avg_so2), no2_label: data_s(avg_no2),
      #                co_label: data_s(avg_co), pm25_label: data_s(avg_pm25), pm10_label: data_s(avg_pm10)}
      # end
      # #审核日报表插入
      # if day_data.present?
      #   DAuditDataDailie.bulk_insert(update_duplicates: true) do |day|
      #     day_data.each do |d|
      #       day.add(d)
      #     end
      #   end
      # end

      # #日报表插入
      # if day_data.present?
      #   DAuditDataDailie.bulk_insert(update_duplicates: true) do |day|
      #     day_data.each do |d|
      #       day.add(d)
      #     end
      #   end
    end
  end

  #解析，返回数据一场标识
  def self.data_s(data)
    return nil if !data.present? || data == "-"
    data_a = data.to_s #转换为字符串类型
    if data_a.include? "H" #判断是否包含异常符号
      return "H"
    elsif data_a.include? "BB"
      return "B"
    else
      return nil
    end
  end

end