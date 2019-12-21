class HttpTollJob < ActiveJob::Base
  require 'java'
  require '/root/java/wz_lkjh-1.0-SNAPSHOT.jar'
  def perform(*args)
    java_import 'com.logstash.Main'
    Main.exce(es_datas)

  end

end
