module PipeRocket
  class Field < Entity
    attr_accessor :is_subfield, :option_id
    def initialize(hash)
      super
      @is_subfield ||= false
    end

    def options_hash
      return {} unless @options
      @options.map{|option|{option['id'].to_s => option['label']}}.inject(:merge)
    end
    
    def value
      options_hash[option_id]
    end
  end
end
