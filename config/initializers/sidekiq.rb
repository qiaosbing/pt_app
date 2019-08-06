Sidekiq.configure_server do |config|
config.redis = { url: 'redis://localhost',id: nil }
end

Sidekiq.configure_client do |config|
config.redis = { url: 'redis://localhost', id: nil}
end
