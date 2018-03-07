require "rails_response_headers/filter"

module RailsResponseHeaders
  class Railtie < Rails::Railtie
    config.response_headers = ActiveSupport::OrderedOptions.new

    initializer "rails_response_headers.extend_action_controller" do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, RailsResponseHeaders::Filter)
      end
    end

    initializer "rails_response_headers.configure" do
      config.response_headers.config ||= Rails.root.join("config/response-headers.yml")
    end

    config.to_prepare do
      ActionController::Base.load_rails_response_headers
    end
  end
end
