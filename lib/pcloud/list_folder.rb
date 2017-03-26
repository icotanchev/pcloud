module Pcloud
  class ListFolder
    LIST_FOLDER_URL = "#{Pcloud::Constants::BASE_URL}/listfolder"

    attr_accessor :destination_path, :destination_folder_id

    def initialize(destination_path = nil, destination_folder_id = nil)
      raise ArgumentError, 'can not both parameters be nil' if destination_path.nil? && destination_folder_id.nil?

      @destination_path      = destination_path
      @destination_folder_id = destination_folder_id
    end

    def list_folder
      RestClient.post(LIST_FOLDER_URL,
        {
          username: Pcloud::Authentication.username,
          password: Pcloud::Authentication.password,
          path:     destination_path,
          folderid: destination_folder_id
        }
      )
    end
  end
end
