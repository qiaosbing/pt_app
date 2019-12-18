class SocketPustJob < ActiveJob::Base
  require 'socket'

  def perform(*args)
    #建立连接
    data_arr = TCPSocket.new '61.54.242.88', 4000
    #发送数据，新数据格式
    #datas = '<begin>{"data":{"time":1562652495537,"values":[{"name":"C003","value":3.90},{"name":"C104","value":0.0},{"name":"C106","value":3.70},{"name":"C105","value":0.0},{"name":"C108","value":0.0},{"name":"C107","value":1.40}]},"head":{"cmdId":601,"dataIndex":0,"dataLength":3003,"devId":"123456","devType":"AC-GCMS 1000","end":0,"msgId":"201907091408155750000","transferType":0,"version":"1.0"}}<end>'
    datas = '{"ceshi":"数据对接测试！"}'
    data_arr.puts datas

    data = data_arr.gets #收到返回的结果
    puts ">>>打印服务端返回的数据:#{data}"
    if data
      data_arr.close #关闭连接
    end
  end
end