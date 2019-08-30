class KafkaJob < ActiveJob::Base
  require 'kafka'

  def perform(*args)
    Rails.logger.info "==kafka测试==="
    # event = {order_id: "1", amount: "2",timestamp: "3"}

    kafka = Kafka.new(["kafka:9092"])

    Rails.logger.info "======Tpoic=======#{kafka.topics}"
    #$kafka_producer.produce(event.to_jsom, topic: "test")
  end
end