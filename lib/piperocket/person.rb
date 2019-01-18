module PipeRocket
  class Person < Entity
    attr_accessor :email, :phone, :organization, :id
    def initialize(hash)
      @@key_name_hash ||= Pipedrive.person_fields.key_field_hash
      super(hash.except(*@@key_name_hash.keys))
      @email = hash['email'].first['value'] if hash['email']
      @phone = hash['phone'].first['value'] if hash['phone']

      org_id = hash['org_id']
      if org_id
        if org_id.kind_of? Integer
          @organization = Pipedrive.organizations.find(org_id)
        else
          @organization = Organization.new(org_id)
        end
      end

      @id = hash['value'] if hash['value'].present?

      assign_custom_fields(@@key_name_hash, hash)
    end
  end
end
