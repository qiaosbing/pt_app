class CeshiJob < ActiveJob::Base


  def perform(*args)
    #datas = RestClient.get 'http://106.54.8.7:8080/data_min'
    datas = RestClient::Request.execute(method: :get, url: 'http://106.54.8.7:8080/data_min',
                                        timeout: 10)
    req_data = JSON.parse(datas.body)
    d_station = DStation.all
    Rails.logger.info "---#{req_data.inspect}"
    @data_arr = []
    if req_data.present?
      ##封装数据
      req_data.each do |d|
        station = d_station.select { |x| x["dz_station_id"] == d["station_id"] }.first
        next if DData5MinYyyymm.exists?(station_id: station.id.to_s, data_time: d["data_time"])
        next if !d.include? "pm10"
        hash = {station_id: station.id.to_s, station_name: station.station_name, data_time: d["data_time"],
                avg_so2: d["so2"], so2_label: d["so2_label"], iaqi_so2: d["iaqi_so2"],
                avg_no2: d["no2"], no2_label: d["no2_label"], iaqi_no2: d["iaqi_no2"],
                avg_co: d["co"], co_label: d["co_label"], iaqi_co: d["iaqi_co"],
                avg_o3: d["o3"], o3_label: d["o3_label"], iaqi_o3: d["iaqi_o3"],
                avg_pm10: d["pm10"], pm10_label: d["pm10_label"], iaqi_ma24_pm10: d["iaqi_pm10"],
                avg_pm25: d["pm25_label"], pm25_label: d["pm25_label"], iaqi_ma24_pm25: d["iaqi_pm25"],
                avg_tvoc: d["avg_tvoc"], tvoc_label: d["tvoc_label"],
                windspeed: d["windspeed"], windspeed_label: d["windspeed_label"],
                winddirection: d["winddirection"], winddirection_label: d["winddirection_label"],
                temperature: d["temperature"], temperature_label: d["temperature_label"],
                humidity: d["humidity"], humidity_label: d["humidity_label"]}
        @data_arr << hash
      end

      ##储存数据
      if !@data_arr.blank?
        DData5MinYyyymm.bulk_insert(update_duplicates: true) do |worker|
          @data_arr.each do |min_arr|
            worker.add(min_arr)
          end
        end
      end
    end
  end
end