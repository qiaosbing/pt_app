class KafkaJob < ActiveJob::Base
  require 'kafka'

  def perform(*args)
    Rails.logger.info "==kafka测试==="
    host = 'localhost'
    port = 9092
    producer = Kafka::Producer.new(

        :topic => 'test',
        :host => host,
        :port => port
    )
    Rails.logger.info "==链接topic#{producer}==="
    producer.send([Kafka::Message.new("aaaaa")])
  end
end