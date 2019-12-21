class HttpTollJob < ActiveJob::Base
  require "rjb"

  def perform(*args)
    Rjb::load(classpath = '.:/root/java/wz_lkjh-1.0-SNAPSHOT.jar', jvmargs=[])
    tararchive = Rjb::import('com.wz.main.ceshi')

    Rails.logger.info "----#{tararchive.inspect}"
  end

end
