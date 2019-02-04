require 'net/http'
require 'pipe_rocket/entity'
require 'pipe_rocket/field'
unless ENV["RAILS_ENV"] == 'test'
  require 'pipe_rocket/engine'
end
require 'pipe_rocket/service'
require 'pipe_rocket/person_service'
require 'pipe_rocket/field_service'

class Pipedrive

  # Getting deal service object(PipeRocket::Servcice)
  def self.deals
    @@deals_service ||= PipeRocket::Service.new('deal')
  end

  # Getting \deal_fields service object(PipeRocket::FieldServcice)
  def self.deal_fields
    @@deal_fields_service ||= PipeRocket::FieldService.new('dealField')
  end

  # Getting note service object(PipeRocket::Servcice)
  def self.notes
    @@notes_service ||= PipeRocket::Service.new('note')
  end

  # Getting organization service object(PipeRocket::Servcice)
  def self.organizations
    @@organizations_service ||= PipeRocket::Service.new('organization')
  end

  # Getting \organization_field service object(PipeRocket::FieldServcice)
  def self.organization_fields
    @@organization_fields ||= PipeRocket::FieldService.new('organizationField')
  end

  # Getting person service object(PipeRocket::PersonServcice)
  def self.persons
    @@persons_service ||= PipeRocket::PersonService.new('person')
  end

  # Getting \person_field service object(PipeRocket::FieldServcice)
  def self.person_fields
    @@person_fields ||= PipeRocket::FieldService.new('personField')
  end

  # Getting pipeline service object(PipeRocket::Servcice)
  def self.pipelines
    @@pipelines_service ||= PipeRocket::Service.new('pipeline')
  end

  # Getting stages service object(PipeRocket::Servcice)
  def self.stages
    @@stages_service ||= PipeRocket::Service.new('stage')
  end
end
