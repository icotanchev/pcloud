module Pcloud
  class Upload

    UPLOAD_FILE_URL = "#{Pcloud::Constants::BASE_URL}/uploadfile"

    attr_accessor :destination_path, :destination_folder_id, :source_file_name, :source_file_path

    def initialize(destination_path = nil, destination_folder_id = nil, source_file_name, source_file_path)
      raise ArgumentError, 'can not both parameters be nil' if destination_path.nil? && destination_folder_id.nil?

      @destination_path      = destination_path
      @destination_folder_id = destination_folder_id
      @source_file_name      = source_file_name
      @source_file_path      = source_file_path
    end

    def upload
      RestClient.post(UPLOAD_FILE_URL,
        {
          username: Pcloud::Authentication.username,
          password: Pcloud::Authentication.password,
          path:     destination_path,
          folderid: destination_folder_id,
          filename: source_file_name,
          upload: {
            file: source_file
          }
        }
      )
    end

    def source_file
      raise FileMissing, 'passed file is missing' unless File.exists?(source_file_path)
      File.open(source_file_path)
    end
  end
end
