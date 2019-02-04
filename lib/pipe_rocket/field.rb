module PipeRocket
  class Field < Entity
    attr_accessor :is_subfield, :option_id
    def initialize(hash)
      super
      @is_subfield ||= false
    end

    # Return hash {option_id: option_value}
    def options_hash
      return {} unless @options
      @options.map{|option|{option['id'].to_s => option['label']}}.inject(:merge)
    end

    # Return value of field
    def value
      options_hash[option_id]
    end
  end
end
