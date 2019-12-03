class GetIp < ActiveJob::Base
  require 'socket'

  #获取请求用户的IP
  def perform(*args)
    ip = request.remote_ip
  end

  #获取本地ip地址
  def ip
    orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true
    UDPSocket.open do |s|
      s.connect '64.233.187.99', 1
      s.addr.last
    end
  ensure
    Socket.do_not_reverse_lookup = orig
  end
end
