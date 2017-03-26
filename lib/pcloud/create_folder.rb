module Pcloud
  class CreateFolder

    CREATE_FOLDER_URL = "#{Pcloud::Constants::BASE_URL}/createfolder".freeze

    attr_reader :destination_folder_id, :folder_name, :auth

    def initialize(destination_folder_id, folder_name)
      @destination_folder_id = destination_folder_id
      @folder_name           = folder_name
      @auth                  = Pcloud::Authentication.new
    end

    def create_folder
      RestClient.post(CREATE_FOLDER_URL,
        {
          folderid: destination_folder_id,
          name:     folder_name
        }.merge(auth.credentials)
      )
    end
  end
end
