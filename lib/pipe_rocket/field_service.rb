module PipeRocket
  class FieldService < Service
    HOST = 'https://api.pipedrive.com/v1'

    def initialize(resource_name)
      @resource_name = resource_name
    end

    def key_field_hash
      Pipedrive.send("#{@resource_name.split(/(?=[A-Z])/).first}_fields").all.select{|field|field.edit_flag || field.is_subfield}.map{|field|{field.key => field}}.inject(:merge) || {}
    end

    def key_name_hash
      Pipedrive.send("#{@resource_name.split(/(?=[A-Z])/).first}_fields").all.select{|field|field.edit_flag || field.is_subfield}.map{|field|{field.key => field.name}}.inject(:merge) || {}
    end

    def name_key_hash
      Pipedrive.send("#{@resource_name.split(/(?=[A-Z])/).first}_fields").all.select{|field|field.edit_flag || field.is_subfield}.map{|field|{field.name => field.key}}.inject(:merge) || {}
    end
  end
end
