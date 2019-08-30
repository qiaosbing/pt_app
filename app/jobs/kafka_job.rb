class KafkaJob < ActiveJob::Base
  require 'kafka'

  def perform(*args)
    Rails.logger.info "==kafka测试==="
    kafka = Kafka.new(["kafka1:9092", "kafka2:9092"], client_id: "my-application")

    Rails.logger.info "==链接topic#{kafka.inspect}==="
    kafka.deliver_message("Hello, World!", topic: "test")
    Rails.logger.info "==测试结束!==="

    # producer = Kafka::Producer.new(
    #     :topic => 'test',
    #     :host => host,
    #     :port => port
    # )
    #
    # producer.send([Kafka::Message.new("aaaaa")])
  end
end