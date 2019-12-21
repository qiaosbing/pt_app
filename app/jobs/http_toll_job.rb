class HttpTollJob < ActiveJob::Base
  require 'rjb'

  def perform(*args)

    tmp = DmCodec.encodeB62("aaa")

  end

end
