module PipeRocket
  class DealService < Service
    HOST = 'https://api.pipedrive.com/v1'

    def initialize(resource_name)
      @resource_name = resource_name
    end

    def deal_files(deal_id)
      uri = build_uri({}, deal_id, 'files')
      response = HTTP.get(uri)

      case response.code
      when 200
        json_array = ::JSON.parse(response)['data']
        json_array.map{|raw|build_entity(raw, 'file')}
      else
        raise PipeRocket::Error.new(response.code)
      end
    rescue HTTP::ConnectionError
      raise PipeRocket::Error.new(408)
    end

  end
end
