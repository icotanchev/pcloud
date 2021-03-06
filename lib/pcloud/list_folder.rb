module Pcloud
  class ListFolder

    LIST_FOLDER_URL = "#{Pcloud::Constants::BASE_URL}/listfolder".freeze

    attr_reader :destination_folder_id, :auth

    def initialize(destination_folder_id)
      @destination_folder_id = destination_folder_id
      @auth                  = Pcloud::Authentication.new
    end

    def list_folder
      RestClient.post(LIST_FOLDER_URL,
        {
          folderid: destination_folder_id
        }.merge(auth.credentials)
      )
    end
  end
end
