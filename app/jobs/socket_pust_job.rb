class SocketPustJob < ActiveJob::Base
  require 'socket'

  def perform(*args)
    #建立连接
    data_arr = TCPSocket.new '61.54.242.88', 4000
    #发送数据，新数据格式
    datas = '{"ceshi":"数据对接测试！"}'
    data_arr.puts datas
    data_arr.close #关闭连接
  end
end