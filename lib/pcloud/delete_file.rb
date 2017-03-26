module Pcloud
  class DeleteFile

    DELETE_FILE_URL = "#{Pcloud::Constants::BASE_URL}/deletefile".freeze

    attr_reader :destination_file_id, :auth

    def initialize(destination_file_id)
      @destination_file_id = destination_file_id
      @auth                = Pcloud::Authentication.new
    end

    def delete_file
      RestClient.post(DELETE_FILE_URL,
        {
          fileid: destination_file_id
        }.merge(auth.credentials)
      )
    end
  end
end
