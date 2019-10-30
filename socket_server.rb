require 'socket'
require 'fileutils'

module SocketServer
  class Server
    def self.start
      tcp_server = TCPServer.open 30001
      print("================TCPServer on port 30001 for 4G Micro Station===============", "\n")
      loop do
        Thread.start(tcp_server.accept) do |client|
          data_time = Time.now
          datas = client.gets
          print "---#{data_time.strftime("%Y-%m-%d %H:%M")}---数据：#{datas.inspect}"
          client.close
        end
      end
    end
  end
end

SocketServer::Server.start
