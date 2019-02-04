module PipeRocket
  class Organization < Entity
    attr_accessor :id
    
    # Returns hash {custom_field_key: PipeRocket::Field object}
    def self.key_field_hash
      @@key_field_hash ||= Pipedrive.organization_fields.key_field_hash
    end

    def initialize(hash)
      super(hash.except(*Organization.key_field_hash.keys))
      @id = hash['value'] if hash['value'].present?
      assign_custom_fields(Organization.key_field_hash, hash)
    end
  end
end
