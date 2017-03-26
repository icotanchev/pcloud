module Pcloud
  class Upload

    UPLOAD_FILE_URL = "#{Pcloud::Constants::BASE_URL}/uploadfile".freeze

    attr_reader :destination_folder_id, :source_file_name, :source_file_path, :auth

    def initialize(destination_folder_id, source_file_name, source_file_path)
      @destination_folder_id = destination_folder_id
      @source_file_name      = source_file_name
      @source_file_path      = source_file_path
      @auth                  = Pcloud::Authentication.new
    end

    def upload
      RestClient.post(UPLOAD_FILE_URL,
        auth.credentials.merge(
          folderid: destination_folder_id,
          filename: source_file_name,
          upload: {
            file: source_file
          }
        )
      )
    end

    def source_file
      raise StandardError, 'passed file is missing' unless File.exists?(source_file_path)

      File.open(source_file_path)
    end
  end
end
