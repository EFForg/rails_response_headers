module RailsResponseHeaders
  module Filter
    extend ActiveSupport::Concern

    included do
      cattr_accessor :rails_response_headers

      before_action :set_rails_response_headers
    end

    class_methods do
      def load_rails_response_headers
        config_file = Rails.application.config.response_headers.config

        if File.exists?(config_file)
          self.rails_response_headers = YAML.load_file(config_file)
        else
          self.rails_response_headers = {}
        end
      end
    end

    private

    def set_rails_response_headers
      controller_map = rails_response_headers[controller_name] || {}
      action_headers = controller_map[action_name] || {}

      action_headers.each do |name, value|
        response.headers[name] ||= value
      end
    end
  end
end
