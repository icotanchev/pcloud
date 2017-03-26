module Pcloud
  class Authentication
    
    def self.username
      @username ||= yaml_settings['username']
    end

    def self.password
      @password ||= yaml_settings['password']
    end

    def self.yaml_settings
      file_path = File.join(Rails.root, 'config', 'pcloud.yml')
      YAML.load_file(file_path)
    end
  end
end
