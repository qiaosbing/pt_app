class KafkaJob < ActiveJob::Base
  require 'kafka'

  def perform(*args)
    Rails.logger.info "==kafka测试==="
    event = {
        order_id: "1",
        amount: "2",
        timestamp: "3",
    }
    $kafka_producer.produce(event.to_json, topic: "test")
  end
end