module Pcloud
  class GetFileLink

    GET_FILE_URL = "#{Pcloud::Constants::BASE_URL}/getfilelink".freeze

    attr_reader :source_file_id, :auth

    def initialize(source_file_id)
      @source_file_id = source_file_id
      @auth           = Pcloud::Authentication.new
    end

    def get_file_link
      RestClient.post(GET_FILE_URL,
        {
          fileid: source_file_id
        }.merge(auth.credentials)
      )
    end
  end
end
