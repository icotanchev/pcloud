module Pcloud
  class DeleteFolder

    DELETE_FOLDER_URL = "#{Pcloud::Constants::BASE_URL}/deletefolderrecursive".freeze

    attr_reader :destination_folder_id, :auth

    def initialize(destination_folder_id)
      @destination_folder_id = destination_folder_id
      @auth                  = Pcloud::Authentication.new
    end

    def delete_folder
      RestClient.post(DELETE_FOLDER_URL,
        {
          folderid: destination_folder_id
        }.merge(auth.credentials)
      )
    end
  end
end
