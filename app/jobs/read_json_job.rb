class ReadJsonJob < ActiveJob::Base

  def perform(*args)
    #将指定数据生成json文件
    data_time = "20190915".to_time
    #获取数据
    data_min = DData5MinYyyymm.where(:data_time => data_time.strftime('%Y%m%d%H00')..data_time.strftime('%Y%m%d%H55'))
    @data_arr = []
    data_min.each do |min|
      @data_arr << min.to_json
    end
    d_size = open_data(@data_arr)
    Rails.logger.info "==储存数据的字节==#{d_size.inspect}"

      # #读取文件的路径
    # url = "#{Rails.root}/public/json/json_min.json"
    # #调用方法获取数据
    # data = read_data(url)
    # Rails.logger.info "==读取的数据==#{data.inspect}"
  end

  #读取json文件
  def read_data(url)
    #读取json文件数据
    data_json = File.read(url)
    #解析数据据
    data_json = eval(data_json)
    @data_arr = []
    data_json.each do |json|
      @data_arr << JSON.parse(json)
    end
    return @data_arr
  end

  #生成json文件
  def open_data(data)
    json_name = "json_min.json" #json文件名称
    file_path = "#{Rails.root}/public/json" #json文件路径
    FileUtils.mkdir_p(file_path) unless File.exist?(file_path) #文件不存在则创建
    File.open(Rails.root.join("#{file_path}", json_name), 'wb') {|f| f.write(data)}
  end
end
