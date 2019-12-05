class ReadJsonJob < ActiveJob::Base

  def perform(*args)
    # data_time = "20190915".to_time
    # #获取数据
    # data_min = DData5MinYyyymm.where(:data_time => data_time.strftime('%Y%m%d%H00') .. data_time.strftime('%Y%m%d%H55'))
    #
    # json_name = "json_min.json" #json文件名称
    # file_path = "#{Rails.root}/public/json" #json文件路径
    # FileUtils.mkdir_p(file_path) unless File.exist?(file_path) #文件不存在则创建
    #
    # File.open(Rails.root.join("#{file_path}", json_name), 'wb') {|f| f.write(data_min)}

    #读取json文件数据
    data_json = File.read("#{Rails.root}/public/json/json_min.json")
    Rails.logger.info "====#{data_json.inspect}"
  end
end
