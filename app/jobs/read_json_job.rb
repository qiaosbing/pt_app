class ReadJsonJob < ActiveJob::Base

  def perform(*args)
    # data_time = "20190915".to_time
    # #获取数据
    # data_min = DData5MinYyyymm.where(:data_time => data_time.strftime('%Y%m%d%H00')..data_time.strftime('%Y%m%d%H55'))
    # @data_arr = []
    # data_min.each do |min|
    #   @data_arr << min.to_json
    # end
    # json_name = "json_min.json" #json文件名称
    # file_path = "#{Rails.root}/public/json" #json文件路径
    # FileUtils.mkdir_p(file_path) unless File.exist?(file_path) #文件不存在则创建
    #
    # File.open(Rails.root.join("#{file_path}", json_name), 'wb') {|f| f.write(@data_arr)}

    #读取json文件数据
    data_json = File.read("#{Rails.root}/public/json/json_min.json")
    eval(data_json) #解析数据据

    @data_arr = []
    data_json.each do |json|
      @data_arr << JSON.parse(json)
    end
    Rails.logger.info "====#{@data_arr.inspect}"
  end
end
