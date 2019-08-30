class KafkaJob < ActiveJob::Base
  require 'kafka'

  def perform(*args)
    Rails.logger.info "==kafka测试==="
    Rails.logger.info "==链接topic#{Kafka}==="

    host = 'localhost'
    port = 9092
    kafka = Kafka.new(
        :topic => 'test',
        :host => host,
        :port => port
    )
    Rails.logger.info "==链接topic#{kafka}==="
    kafka.deliver_message("Hello, World!", topic: "test")

    # producer = Kafka::Producer.new(
    #     :topic => 'test',
    #     :host => host,
    #     :port => port
    # )
    #
    # producer.send([Kafka::Message.new("aaaaa")])
  end
end