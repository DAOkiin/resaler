if Rails.env.development?
  Rack::Timeout.unregister_state_change_observer(:logger)
  service_timeout = 60
else
  service_timeout = ENV.fetch('REQUEST_TIMEOUT') { 5 }.to_i
end
Rails.application.config.middleware
     .insert_before Rack::Runtime,
                    Rack::Timeout,
                    service_timeout: service_timeout
