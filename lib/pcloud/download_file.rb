module Pcloud
  class DownloadFile

    attr_reader :source_file_link, :destination_file_path, :auth

    def initialize(source_file_link, destination_file_path)
      @source_file_link      = source_file_link
      @destination_file_path = destination_file_path
      @auth                  = Pcloud::Authentication.new
    end

    def download_file
      uri      = URI(source_file_link)
      response = Net::HTTP.get_response(uri)

      case response
      when Net::HTTPSuccess
        file = "#{destination_file_path}/#{source_file_link.split('/').last}"
        File.open(file, 'wb') { |content| content.write(response.body) }
      else
        raise StandardError, 'Something went wrong :('
      end
    end
  end
end
