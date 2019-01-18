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

  def self.deals
    @@deals_service ||= PipeRocket::Service.new('deal')
  end

  def self.deal_fields
    @@deal_fields_service ||= PipeRocket::FieldService.new('dealField')
  end

  def self.notes
    @@notes_service ||= PipeRocket::Service.new('note')
  end

  def self.organizations
    @@organizations_service ||= PipeRocket::Service.new('organization')
  end

  def self.organization_fields
    @@organization_fields ||= PipeRocket::FieldService.new('organizationField')
  end

  def self.persons
    @@persons_service ||= PipeRocket::PersonService.new('person')
  end

  def self.person_fields
    @@person_fields ||= PipeRocket::FieldService.new('personField')
  end

  def self.pipelines
    @@pipelines_service ||= PipeRocket::Service.new('pipeline')
  end

  def self.stages
    @@stages_service ||= PipeRocket::Service.new('stage')
  end
end
