require 'net/http'
require 'pipedrive_jetrockets/entity'
require 'pipedrive_jetrockets/field'
unless ENV["RAILS_ENV"] == 'test'
  require 'pipedrive_jetrockets/engine'
end
require 'pipedrive_jetrockets/service'
require 'pipedrive_jetrockets/person_service'
require 'pipedrive_jetrockets/field_service'

class Pipedrive

  def self.deals
    @@deals_service ||= PipedriveJetrockets::Service.new('deal')
  end

  def self.deal_fields
    @@deal_fields_service ||= PipedriveJetrockets::FieldService.new('dealField')
  end

  def self.notes
    @@notes_service ||= PipedriveJetrockets::Service.new('note')
  end

  def self.organizations
    @@organizations_service ||= PipedriveJetrockets::Service.new('organization')
  end

  def self.organization_fields
    @@organization_fields ||= PipedriveJetrockets::FieldService.new('organizationField')
  end

  def self.persons
    @@persons_service ||= PipedriveJetrockets::PersonService.new('person')
  end

  def self.person_fields
    @@person_fields ||= PipedriveJetrockets::FieldService.new('personField')
  end

  def self.pipelines
    @@pipelines_service ||= PipedriveJetrockets::Service.new('pipeline')
  end

  def self.stages
    @@stages_service ||= PipedriveJetrockets::Service.new('stage')
  end
end
