module Pcloud
  class CreateFolder

    CREATE_FOLDER_URL = "#{Pcloud::Constants::BASE_URL}/createfolder"

    attr_accessor :destination_folder_id, :folder_name

    def initialize(destination_folder_id, folder_name)
      @destination_folder_id = destination_folder_id
      @folder_name           = folder_name
    end

    def create_folder
      RestClient.post(CREATE_FOLDER_URL,
        {
          username: Pcloud::Authentication.username,
          password: Pcloud::Authentication.password,
          folderid: destination_folder_id,
          name:     folder_name
        }
      )
    end
  end
end
