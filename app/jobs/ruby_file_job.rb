class RubyFileJob < ActiveJob::Base

  def perform(*args)
    datas = '<begin>{"data":{"time":1562652495537,"values":[{"name":"C003","value":3.90},{"name":"C104","value":0.0},{"name":"C106","value":3.70},{"name":"C105","value":0.0},{"name":"C108","value":0.0},{"name":"C107","value":1.40}]},"head":{"cmdId":601,"dataIndex":0,"dataLength":3003,"devId":"123456","devType":"AC-GCMS 1000","end":0,"msgId":"201907091408155750000","transferType":0,"version":"1.0"}}<end>'
    data_time = Time.now
    @root_path = "#{Rails.root}/public/voc_log/#{data_time.strftime('%Y-%m-%d')}"
    FileUtils.mkdir_p(@root_path) unless File.exist?(@root_path) # 如果路径不存在：创建
    File.open("#{@root_path}/#{data_time.hour}.txt", 'a') do |f|
      f.syswrite(datas + "\n")
    end
  end
end