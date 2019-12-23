class HttpToolJob < ActiveJob::Base


  def perform(*args)
    # datas = RestClient.get 'http://106.54.8.7:8080/data_hour'
    # req_data = JSON.parse(datas.body)
    datas = [{"chief_pollutant" => "PM2.5", "aqi_level" => "null", "iaqi_co" => "null", "station_id" => "S6403000002", "iaqi_so2" => "null", "pm10" => "94", "iaqi_o3" => "null", "pm25_label" => "N", "iaqi_pm25" => "null", "pm10_label" => "N", "pm25" => "76", "iaqi_pm10" => "null", "data_time" => "2019122319", "aqi" => "null", "iaqi_no2" => "null"}, {"chief_pollutant" => "PM2.5", "aqi_level" => "良", "co_label" => "N", "avg_tvoc" => "43", "iaqi_co" => "12", "iaqi_o3" => "14", "no2" => "38", "pm25_label" => "N", "pm10_label" => "N", "iaqi_pm10" => "59", "data_time" => "2019122319", "so2" => "6", "so2_label" => "N", "iaqi_no2" => "19", "o3" => "43", "o3_label" => "N", "station_id" => "S6403000003", "iaqi_so2" => "2", "pm10" => "68", "co" => "1.135", "iaqi_pm25" => "72", "tvoc_label" => "N", "pm25" => "52", "aqi" => "72", "no2_label" => "N"}, {"chief_pollutant" => "PM2.5", "aqi_level" => "null", "iaqi_co" => "null", "station_id" => "S6403000004", "iaqi_so2" => "null", "pm10" => "73", "iaqi_o3" => "null", "pm25_label" => "N", "iaqi_pm25" => "null", "pm25" => "58", "pm10_label" => "N", "iaqi_pm10" => "null", "data_time" => "2019122319", "aqi" => "null", "iaqi_no2" => "null"}, {"chief_pollutant" => "PM2.5", "aqi_level" => "null", "iaqi_co" => "null", "station_id" => "S6403000007", "iaqi_so2" => "null", "pm10" => "75", "iaqi_o3" => "null", "pm25_label" => "N", "iaqi_pm25" => "null", "pm25" => "52", "pm10_label" => "N", "iaqi_pm10" => "null", "data_time" => "2019122319", "aqi" => "null", "iaqi_no2" => "null"}, {"iaqi_pm25" => "null", "chief_pollutant" => "null", "aqi_level" => "null", "iaqi_pm10" => "null", "data_time" => "2019122319", "iaqi_co" => "null", "station_id" => "S6403000010", "iaqi_so2" => "null", "aqi" => "null", "iaqi_no2" => "null", "iaqi_o3" => "null"}, {"chief_pollutant" => "PM2.5", "aqi_level" => "良", "co_label" => "N", "avg_tvoc" => "37", "iaqi_co" => "11", "iaqi_o3" => "12", "pm25_label" => "N", "no2" => "36", "pm10_label" => "N", "iaqi_pm10" => "60", "data_time" => "2019122319", "so2" => "22", "so2_label" => "N", "iaqi_no2" => "18", "winddirection_label" => "N", "o3" => "37", "o3_label" => "N", "station_id" => "S6403000012", "iaqi_so2" => "8", "pm10" => "69", "co" => "1.059", "winddirection" => "305", "iaqi_pm25" => "72", "tvoc_label" => "N", "windspeed_label" => "N", "pm25" => "52", "aqi" => "72", "windspeed" => "0.71", "no2_label" => "N"}, {"iaqi_pm25" => "null", "chief_pollutant" => "null", "aqi_level" => "null", "iaqi_pm10" => "null", "data_time" => "2019122319", "iaqi_co" => "null", "station_id" => "S6403000013", "iaqi_so2" => "null", "aqi" => "null", "iaqi_no2" => "null", "iaqi_o3" => "null"}, {"chief_pollutant" => "NO2", "aqi_level" => "优", "co_label" => "N", "o3" => "40", "o3_label" => "N", "avg_tvoc" => "40", "iaqi_co" => "12", "station_id" => "S6403000014", "iaqi_so2" => "2", "co" => "1.178", "iaqi_o3" => "13", "no2" => "38", "iaqi_pm25" => "null", "tvoc_label" => "N", "iaqi_pm10" => "null", "data_time" => "2019122319", "so2" => "6", "so2_label" => "N", "aqi" => "19", "no2_label" => "N", "iaqi_no2" => "19"}, {"chief_pollutant" => "PM2.5", "aqi_level" => "良", "co_label" => "N", "avg_tvoc" => "5", "iaqi_co" => "6", "iaqi_o3" => "2", "pm25_label" => "N", "no2" => "38", "pm10_label" => "N", "iaqi_pm10" => "79", "data_time" => "2019122319", "so2" => "7", "so2_label" => "N", "iaqi_no2" => "19", "o3" => "5", "o3_label" => "N", "station_id" => "S64030310001", "iaqi_so2" => "3", "pm10" => "107", "co" => "0.571", "iaqi_pm25" => "100", "tvoc_label" => "N", "pm25" => "75", "aqi" => "100", "no2_label" => "N"}, {"chief_pollutant" => "PM2.5", "aqi_level" => "良", "co_label" => "N", "avg_tvoc" => "40", "iaqi_co" => "8", "iaqi_o3" => "13", "pm25_label" => "N", "no2" => "30", "pm10_label" => "N", "iaqi_pm10" => "55", "data_time" => "2019122319", "so2" => "31", "so2_label" => "N", "iaqi_no2" => "15", "o3" => "40", "o3_label" => "N", "station_id" => "S64030310002", "iaqi_so2" => "11", "pm10" => "60", "co" => "0.729", "iaqi_pm25" => "64", "tvoc_label" => "N", "pm25" => "46", "aqi" => "64", "no2_label" => "N"}, {"iaqi_pm25" => "null", "chief_pollutant" => "null", "aqi_level" => "null", "iaqi_pm10" => "null", "data_time" => "2019122319", "iaqi_co" => "null", "station_id" => "S64030210003", "iaqi_so2" => "null", "aqi" => "null", "iaqi_no2" => "null", "iaqi_o3" => "null"}, {"chief_pollutant" => "NO2", "aqi_level" => "优", "co_label" => "N", "o3" => "42", "o3_label" => "N", "avg_tvoc" => "42", "iaqi_co" => "8", "station_id" => "S64030310005", "iaqi_so2" => "10", "co" => "0.709", "iaqi_o3" => "14", "no2" => "30", "iaqi_pm25" => "null", "tvoc_label" => "N", "iaqi_pm10" => "null", "data_time" => "2019122319", "so2" => "28", "so2_label" => "N", "aqi" => "15", "no2_label" => "N", "iaqi_no2" => "15"}, {"chief_pollutant" => "PM2.5", "aqi_level" => "良", "co_label" => "N", "iaqi_co" => "8", "avg_tvoc" => "41", "iaqi_o3" => "13", "pm25_label" => "N", "no2" => "30", "iaqi_pm10" => "65", "pm10_label" => "N", "data_time" => "2019122319", "so2" => "27", "so2_label" => "N", "iaqi_no2" => "15", "o3" => "41", "o3_label" => "N", "station_id" => "S64030310006", "iaqi_so2" => "9", "pm10" => "80", "co" => "0.740", "iaqi_pm25" => "84", "tvoc_label" => "N", "pm25" => "62", "aqi" => "84", "no2_label" => "N"}]
    d_station = DStation.all

    @data_arr = []
    datas.each do |d|
      station = d_station.select { |x| x["dz_station_id"] == d["station_id"] }.first
      next if DDataHourlyYyyy.exists?(station: station.id.to_s, data_time: d["data_time"])
      hash = {station_id: station.id.to_s, station_name: station.station_name, data_time: d["data_time"],
              avg_so2: d["avg_so2"], so2_label: d["so2_label"], iaqi_so2: d["iaqi_so2"],
              avg_no2: d["avg_no2"], no2_label: d["no2_label"], iaqi_no2: d["iaqi_no2"],
              avg_co: d["avg_co"], co_label: d["co_label"], iaqi_co: d["iaqi_co"],
              avg_o3: d["avg_o3"], o3_label: d["o3_label"], iaqi_o3: d["iaqi_o3"],
              avg_pm10: d["avg_pm10"], pm10_label: d["pm10_label"], iaqi_ma24_pm10: d["iaqi_ma24_pm10"],
              avg_pm25: d["pm25_label"], pm25_label: d["pm25_label"], iaqi_ma24_pm25: d["iaqi_ma24_pm25"],
              avg_tvoc: d["avg_tvoc"], tvoc_label: d["tvoc_label"],
              windspeed: d["windspeed"], windspeed_label: d["windspeed_label"],
              winddirection: d["winddirection"], winddirection_label: d["winddirection_label"],
              temperature: d["temperature"], temperature_label: d["temperature_label"],
              humidity: d["humidity"], humidity_label: d["humidity_label"]}
      @data_arr << hash
    end
    if !@data_arr.blank?
      DDataHourlyYyyy.bulk_insert(update_duplicates: true) do |worker|
        @data_arr.each do |min_arr|
          worker.add(min_arr)
        end
      end
    end
  end
end
