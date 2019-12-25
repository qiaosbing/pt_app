class SocketPustJob < ActiveJob::Base
  require 'socket'

  def perform(*args)
    #建立连接
    data_arr = TCPSocket.new '61.54.242.88', 4000
    #发送数据，新数据格式
    datas = '{"ceshi":"Socket服务端，数据传输测试！","data":{:qc=>0, :time=>1577256803260, :values=>[{:name=>"a24113", :value=>0.0}, {:name=>"a25059", :value=>1.4}]}, :head=>{:cmdId=>601, :dataIndex=>0, :dataLength=>3747, :devId=>"AG0101G0016S", :devType=>"AC-GCMS1000", :end=>0, :msgId=>"201912251453232610000", :transferType=>0, :version=>"1.0"}}'
    data_arr.puts datas
    data_arr.close #关闭连接
  end
end