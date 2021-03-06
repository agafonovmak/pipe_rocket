module PipeRocket
  class Entity
    def initialize(hash)
      hash.each do |k,v|
        if k[0] =~ /[a-zA-Z_]/
          instance_variable_set("@#{k}",v)
          self.class.class_eval {attr_accessor k}
        end
      end
    end

    # Assign custom fields, using their names but not keys
    def assign_custom_fields(key_name_hash, entity_hash)
      names = key_name_hash.map do |key, field|
        name = field.name
        name = name.underscore.gsub(' ','_')
        name = name.gsub('%','percent').gsub(/[^a-zA-Z0-9_]/,'')
        name = transform_field_name(key, name)
        if field.field_type == 'enum'
          option_id = entity_hash[key]
          res_field = field.dup
          res_field.option_id = option_id
          instance_variable_set("@#{name}", res_field)
        else
          instance_variable_set("@#{name}", entity_hash[key])
        end
        name
      end
      self.class.class_eval {attr_accessor *names}
    end

    # Override custom field name if it present in CUSTOM_FIELD_NAMES
    def transform_field_name(key, name)
      hash = ::CUSTOM_FIELD_NAMES
      class_name = self.class.name.demodulize.underscore.to_sym
      return name if hash.nil? || hash[class_name].nil? || hash[class_name][key.to_sym].nil?
      hash[class_name][key.to_sym]
    end
  end
end
