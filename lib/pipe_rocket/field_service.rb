module PipeRocket
  class FieldService < Service
    HOST = 'https://api.pipedrive.com/v1'

    def initialize(resource_name)
      @resource_name = resource_name
    end

    # Returns hash {custom_field_key: PipeRocket::Field object}
    def key_field_hash
      Pipedrive.send("#{@resource_name.split(/(?=[A-Z])/).first}_fields").all.select{|field|field.edit_flag || field.is_subfield}.map{|field|{field.key => field}}.inject(:merge) || {}
    end

    # Returns hash {custom_field_key: custom_field_name}
    def key_name_hash
      Pipedrive.send("#{@resource_name.split(/(?=[A-Z])/).first}_fields").all.select{|field|field.edit_flag || field.is_subfield}.map{|field|{field.key => field.name}}.inject(:merge) || {}
    end

    # Returns hash {custom_field_name: custom_field_key}
    def name_key_hash
      Pipedrive.send("#{@resource_name.split(/(?=[A-Z])/).first}_fields").all.select{|field|field.edit_flag || field.is_subfield}.map{|field|{field.name => field.key}}.inject(:merge) || {}
    end
  end
end
