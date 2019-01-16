module PipedriveJetrockets
  class Error < StandardError
    attr_accessor :code
    def initialize(code)
      @code = code
    end
  end
end
