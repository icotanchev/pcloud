require 'rails/generators'

module Pcloud
  module Generators
    class PcloudGenerator < ::Rails::Generators::Base
      desc 'Generates a custom Rails Pcloud initializer file.'

      source_root File.expand_path("..", __FILE__)

      def copy_initializer_file
        copy_file "pcloud.yml", "config/pcloud.yml"
      end
    end
  end
end
