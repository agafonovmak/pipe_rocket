Pipedrive API wrapper for Ruby on Rails.

# Installation
Add this line to your application's Gemfile:

```
gem 'pipedrive_jetrockets'
```

And then execute:

```
bundle
```

Or install it yourself as:

```
gem install pipedrive_jetrockets
```

# Setup
```
#config/initializers/pipedrive.rb

ENV['pipedrive_api_token'] = '[YOUR_API_TOKEN]'
CUSTOM_FIELD_NAMES = {
  deal: {
    b6be1824d9...90fea09: 'name'
  }
}
```
CUSTOM_FIELD_NAMES - hash, which overrides custom field names from server. If you want to have same names as remote, just assign empty hash({}).

# Usage

## Pipedrive::Entity heirs

### Pipedrive::Deal
#### methods:

stage - returns Pipeline::Stage object

display_stage_name - returns deal stage(e.g. Sales:Contact Made)

### Pipedrive::Note
### Pipedrive::Organisation
### Pipedrive::Person
### Pipedrive::Pipeline
### Pipeline::Stage
#### methods:

display_name - returns stage name(e.g. Sales:Contact Made)

pipeline - returns Pipedrive::Pipeline object

## Methods

All api methods returns Pipedrive::Entity heir objects. They have attr_accessor methods for all fields, returned by API. Custom fields can be accessed by their name(not key) or by name specified in CUSTOM_FIELD_NAMES.
 
## Get all records
```
Pipedrive.deals.all
Pipedrive.deal_fields.all
Pipedrive.notes.all
Pipedrive.organizations.all
Pipedrive.organization_fields.all
Pipedrive.persons.all
Pipedrive.person_fields.all
Pipedrive.pipelines.all
Pipedrive.stages.all
```

## Get record by id
```
Pipedrive.deals.find([id])
Pipedrive.deal_fields.find([id])
Pipedrive.notes.find([id])
Pipedrive.organizations.find([id])
Pipedrive.organization_fields.find([id])
Pipedrive.persons.find([id])
Pipedrive.person_fields.find([id])
Pipedrive.pipelines.find([id])
Pipedrive.stages.find([id])
```

## Create record
```
Pipedrive.deals.create([hash])
Pipedrive.deal_fields.create([hash])
Pipedrive.notes.create([hash])
Pipedrive.organizations.create([hash])
Pipedrive.organization_fields.create([hash])
Pipedrive.persons.create([hash])
Pipedrive.person_fields.create([hash])
Pipedrive.pipelines.create([hash])
Pipedrive.stages.create([hash])
```

## Get persons by email
```
Pipedrive.persons.find_by_email([email])
```

# Webhooks
Gem provides way to receive webhooks from Pipedrive. 
Endpoint url should looks like this:

    host/pipedrive/[object]/[action]

For example:

    host/pipedrive/deal/updated

If event happens gem send ActiveSupport::Notification like 'deal_updated' with related object.

## Handle events
```
#config/initializers/events.rb

ActiveSupport::Notifications.subscribe '[object]_[action]' do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  [object] = event.payload[:[object]] #PipedriveJetrockets::[object] object
end

e.g

ActiveSupport::Notifications.subscribe 'deal_updated' do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  deal = event.payload[:deal] #PipedriveJetrockets::Deal object
end
```

This will work with deal, note, organization, person, pipeline, stage, user objects and all event actions.

# Exceptions
If there is no connection or Pipedrive API returns error code, gem raises PipedriveJetrockets::Error. Error object has field *code* which contains HTTP error code(e.g. 400, 404, 408)
