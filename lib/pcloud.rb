require 'rest-client'

require File.dirname(__FILE__) + '/pcloud/version'
require File.dirname(__FILE__) + '/pcloud/constants'
require File.dirname(__FILE__) + '/pcloud/authentication'
require File.dirname(__FILE__) + '/pcloud/upload'
require File.dirname(__FILE__) + '/pcloud/list_folder'
require File.dirname(__FILE__) + '/pcloud/create_folder'

module Pcloud

  def self.upload(source_file_name, source_file_path, destination_path = nil, destination_folder_id = nil)
    response = Pcloud::Upload.new(destination_path, destination_folder_id, source_file_name, source_file_path).upload

    JSON.parse(response, { symbolize_names: true })
  end

  def self.list_folder(destination_path = nil, destination_folder_id = nil)
    response = Pcloud::ListFolder.new(destination_path, destination_folder_id).list_folder

    JSON.parse(response, { symbolize_names: true })
  end

  def self.create_folder(destination_folder_id, folder_name)
    response = Pcloud::CreateFolder.new(destination_folder_id, folder_name).create_folder

    JSON.parse(response, { symbolize_names: true })
  end
end
