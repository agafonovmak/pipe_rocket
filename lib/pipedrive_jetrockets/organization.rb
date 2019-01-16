module PipedriveJetrockets
  class Organization < Entity
    def initialize(hash)
      @@key_name_hash ||= Pipedrive.organization_fields.key_field_hash
      super(hash.except(*@@key_name_hash.keys))
      @id = hash['value'] if hash['value'].present?

      assign_custom_fields(@@key_name_hash, hash)
    end
  end
end
