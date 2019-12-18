class RubyFileJob < ActiveJob::Base

  def perform(*args)
    data = "11111111"
    data_time = Time.now
    @root_path = "#{Rails.root}/public/voc_log/#{data_time.strftime('%Y-%m-%d')}"
    FileUtils.mkdir_p(@root_path) unless File.exist?(@root_path) # 如果路径不存在：创建
    File.open("#{@root_path}/#{data_time.hour}.txt", 'a') do |f|
      f.syswrite(data + "\n")
    end
  end
end