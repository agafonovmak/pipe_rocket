module PipeRocket
  class FileService < Service
    HOST = 'https://api.pipedrive.com/v1'

    def initialize(resource_name)
      @resource_name = resource_name
    end

    # Download a file by id
    def file_url(id)
      uri = build_uri({}, id, 'download')
      response = HTTP.get(uri)

      case response.code
      when 302
        response.headers['Location']
      else
        raise PipeRocket::Error.new(response.code)
      end
    rescue HTTP::ConnectionError
      raise PipeRocket::Error.new(408)
    end

  end
end
