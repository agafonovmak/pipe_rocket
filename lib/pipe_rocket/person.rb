module PipeRocket
  class Person < Entity
    attr_accessor :email, :phone, :organization, :id

    def self.key_field_hash
      @@key_field_hash ||= Pipedrive.person_fields.key_field_hash
    end

    def initialize(hash)
      super(hash.except(*Person.key_field_hash.keys))
      @email = hash['email'].first['value'] if hash['email']
      @phone = hash['phone'].first['value'] if hash['phone']
      @id = hash['value'] if hash['value'].present?

      assign_custom_fields(Person.key_field_hash, hash)

      org_id = hash['org_id']
      if org_id
        @organization = case org_id
          when Integer
            Pipedrive.organizations.find(org_id)
          when Hash
            Organization.new(org_id)
          else
            nil
        end
      end
    end      
  end
end
