require 'socket'
require 'fileutils'

module SocketServer
  class Server
    def self.start
      tcp_server = TCPServer.open 30001
      @root_path = "/home/envsafe/pro/Air2New/public/socket"
      FileUtils.mkdir_p(@root_path) unless File.exist?(@root_path) # 如果路径不存在：创建
      print("================TCPServer on port 30001 for 4G Micro Station===============", "\n")
      loop do
        Thread.start(tcp_server.accept) do |client|
          @now_time = Time.now
          @low_path = "/#{@now_time.strftime("%Y%m%d")}/#{@now_time.hour}"  # /20190315/12
          line = client.gets  # 获取上报数据
            if line.size > 5
              iemi = line.scan(/IMEI:\d{15}/)[0].split(':')[1]  #取出IEMI
              puts line + "\n"
              File.open("#{@root_path}/#{iemi}.txt", 'a') do |f|  # 以IEMI号命名文件，若无文件则新建一个
                f.syswrite(line + "\n")
              end
              # 下发指令
              begin
                File.open("#{@root_path}/#{iemi}_op_code.txt", 'r+') do |op_code|
                  f_size = op_code.size
                  l = op_code.sysread(f_size)
                  client.puts l
                  puts '=====指令下发成功====='
                end
              rescue Exception => e
                puts  e
                client.puts 'abcd1234'
              ensure
                File.new("#{@root_path}/#{iemi}_op_code.txt", 'w+').syswrite('')
              end
            end
          client.close
        end
      end
    end
  end
end

SocketServer::Server.start
