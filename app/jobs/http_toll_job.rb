class HttpTollJob < ActiveJob::Base
  require 'java'

  def perform(*args)

    tmp = DmCodec.encodeB62("aaa")

  end

end
