require 'pipe_rocket/organization'
require 'pipe_rocket/person'

module PipeRocket
  class Deal < Entity
    attr_accessor :organization, :person
    def initialize(hash)
      @@key_name_hash ||= Pipedrive.deal_fields.key_field_hash
      super(hash.except(*@@key_name_hash.keys))

      org_id = hash['org_id']
      person_id = hash['person_id']

      assign_custom_fields(@@key_name_hash, hash)

      if org_id
        if org_id.kind_of? Integer
          @organization = Pipedrive.organizations.find(org_id)
        else
          @organization = Organization.new(org_id)
        end
      end

      if person_id
        if person_id.kind_of? Integer
          @person = Pipedrive.persons.find(person_id)
        else
          @person = Person.new(person_id)
        end
      end
    end

    def stage
      Pipedrive.stages.find(self.stage_id)
    end

    def display_stage_name
      self.stage.display_name
    end
  end
end
