require 'rest-client'
require 'net/http'

require File.dirname(__FILE__) + '/pcloud/version'
require File.dirname(__FILE__) + '/pcloud/constants'
require File.dirname(__FILE__) + '/pcloud/authentication'
require File.dirname(__FILE__) + '/pcloud/upload'
require File.dirname(__FILE__) + '/pcloud/list_folder'
require File.dirname(__FILE__) + '/pcloud/delete_folder'
require File.dirname(__FILE__) + '/pcloud/delete_file'
require File.dirname(__FILE__) + '/pcloud/get_file_link'
require File.dirname(__FILE__) + '/pcloud/download_file'
require File.dirname(__FILE__) + '/pcloud/create_folder'

module Pcloud

  def self.upload(source_file_name, source_file_path, destination_folder_id = nil)
    response = Pcloud::Upload.new(destination_folder_id, source_file_name, source_file_path).upload

    JSON.parse(response, { symbolize_names: true })
  end

  def self.list_folder(destination_folder_id)
    response = Pcloud::ListFolder.new(destination_folder_id).list_folder

    JSON.parse(response, { symbolize_names: true })
  end

  def self.create_folder(destination_folder_id, folder_name)
    response = Pcloud::CreateFolder.new(destination_folder_id, folder_name).create_folder

    JSON.parse(response, { symbolize_names: true })
  end

  def self.delete_folder(destination_folder_id)
    response = Pcloud::DeleteFolder.new(destination_folder_id).delete_folder

    JSON.parse(response, { symbolize_names: true })
  end

  def self.delete_file(destination_file_id)
    response = Pcloud::DeleteFile.new(destination_file_id).delete_file

    JSON.parse(response, { symbolize_names: true })
  end

  def self.get_file_link(source_file_id)
    response = Pcloud::GetFileLink.new(source_file_id).get_file_link

    JSON.parse(response, { symbolize_names: true })
  end

  def self.download_file(source_file_url, destination_file_path)
    response = Pcloud::DownloadFile.new(source_file_url, destination_file_path).download_file
  end

  def self.download_file_by_id(source_file_id, destination_file_path)
    link_response = Pcloud::GetFileLink.new(source_file_id).get_file_link

    file_response = JSON.parse(link_response, { symbolize_names: true })

    if file_response[:result] == 0
      file_url = "https://#{file_response[:hosts].first}#{file_response[:path]}"
      Pcloud::DownloadFile.new(file_url, destination_file_path).download_file
    else
      raise StandardError, 'File link is invalid!'
    end
  end
end
