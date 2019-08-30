class KafkaJob < ActiveJob::Base
  require 'kafka'

  def perform(*args)
    Rails.logger.info "==kafka测试==="
    kafka = Kafka.new(["kafka1:9092", "kafka2:9092"], client_id: "my-application")
    Rails.logger.info "==链接topic#{kafka.inspect}==="

    #实例化一个新的生产者。
    producer = kafka.producer
    #将消息添加到生成器缓冲区。
    producer.produce("hello1", topic: "test")
    #将消息发送给Kafka。
    producer.deliver_messages

    #kafka.deliver_message("Hello, World!", topic: "test")
    Rails.logger.info "==测试结束!==="

  end
end