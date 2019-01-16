module PipedriveJetrockets
  class PersonService < Service
    HOST = 'https://api.pipedrive.com/v1'

    def initialize(resource_name)
      @resource_name = resource_name
    end

    def find_by_email(email)
      uri = build_uri({term: email, search_by_email: true }, 'find')
      response = HTTP.get(uri)

      case response.code
      when 200
        json_array = ::JSON.parse(response)['data']
        return [] unless json_array
        json_array.map{|raw|build_entity(raw)}
      else
        raise PipedriveJetrockets::Error.new(response.code)
      end
    rescue HTTP::ConnectionError
      raise PipedriveJetrockets::Error.new(408)
    end

  end
end
