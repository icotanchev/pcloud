module Pcloud
  class Authentication

    PLAIN = 'plain'.freeze
    OAUTH = 'oauth'.freeze
    TYPES = [PLAIN, OAUTH].freeze

    attr_accessor :auth_type, :username, :password, :access_token

    def initialize
      @auth_type = yaml_settings['auth_type']

      raise_invalid_auth_type unless valid_auth_type?

      assign_auth_params
    end

    def credentials
      return { auth: access_token } unless plain_auth?

      {
        username: username,
        password: password
      }
    end

    private

    def plain_auth?
      self.auth_type == PLAIN
    end

    def raise_invalid_auth_type
      raise ArgumentError, 'invalid authentication type'
    end

    def valid_auth_type?
      TYPES.include?(auth_type)
    end

    def assign_auth_params
      send("#{auth_type}_params")
    end

    def plain_params
      @username = yaml_settings['username']
      @password = yaml_settings['password']
    end

    def oauth_params
      @access_token = yaml_settings['access_token']
    end

    def yaml_settings
      @yaml_settings ||= YAML.load_file(File.join(Rails.root, 'config', 'pcloud.yml'))
    end
  end
end
