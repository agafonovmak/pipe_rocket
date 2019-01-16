Pipedrive API wrapper.

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
ENV['pipedrive_api_token'] = '[YOUR_API_TOKEN]'
```

# Usage

## Pipedrive::Entity heirs

### Pipedrive::Deal
#### fields: 

:id, :organisation, :title, :value, :currency, :status, :stage_id, :person, :add_time, :update_time

#### methods:

stage - returns Pipeline::Stage object

display_stage_name - returns deal stage(e.g. Sales:Contact Made)

### Pipedrive::Note
#### fields:

:id, :deal_id, :person_id, :org_id, :content, :add_time, :update_time

### Pipedrive::Organisation
#### fields:

:id, :name, :owner_id, :address, :cc_email, :add_time, :update_time

### Pipedrive::Person
#### fields:

:id, :name, :email, :phone, :open_deals_count, :closed_deals_count, :add_time, :update_time

### Pipedrive::Pipeline
#### fields:

:id, :name, :add_time, :update_time

### Pipeline::Stage
#### fields:

:id, :name, :pipeline_id, :add_time, :update_time

#### methods:

display_name - returns stage name(e.g. Sales:Contact Made)

pipeline - returns Pipedrive::Pipeline object

## Methods

All methods returns Pipedrive::Entity heir objects

## Get all records
```
Pipedrive.deals.all
Pipedrive.notes.all
Pipedrive.persons.all
Pipedrive.stages.all
```

## Get record by id
```
Pipedrive.deals.find([id])
Pipedrive.notes.find([id])
Pipedrive.persons.find([id])
Pipedrive.stages.find([id])
```

## Create record
```
Pipedrive.deals.create([hash])
Pipedrive.notes.create([hash])
Pipedrive.persons.create([hash])
Pipedrive.stages.create([hash])
```

## Get persons by email
```
Pipedrive.persons.find_by_email([email])
```

# Webhooks
## Deal Updated

On

```
https://[your_pipedrive].pipedrive.com/settings/webhooks
```
push 'Create new webhook'.

On this page select following params:

```
Event action = updated

Event object = deal

ENDPOINT URL = [application_host]/pipedrive/deal_updated
```

## Deal Added


```
Event action = added

Event object = deal

ENDPOINT URL = [application_host]/pipedrive/deal_added
```

## Person Updated


```
Event action = updated

Event object = person

ENDPOINT URL = [application_host]/pipedrive/person_updated
```


## Organisation Updated


```
Event action = updated

Event object = organization

ENDPOINT URL = [application_host]/pipedrive/organisation_updated
```


### Usage example
```
#config/initializers/events.rb

ActiveSupport::Notifications.subscribe 'deal_updated' do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  deal = event.payload[:deal] #PipedriveJetrockets::Deal object
end

ActiveSupport::Notifications.subscribe 'deal_added' do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  deal = event.payload[:deal] #PipedriveJetrockets::Deal object
end

ActiveSupport::Notifications.subscribe 'person_updated' do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  person = event.payload[:person] #PipedriveJetrockets::Person object
end

ActiveSupport::Notifications.subscribe 'organisation_updated' do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  organisation = event.payload[:organisation] #PipedriveJetrockets::Organisation object
end
```

# Exceptions
If there is no connection or Pipedrive API returns error code, gem raises PipedriveJetrockets::Error. Error object has field *code* which contains HTTP error code(e.g. 400, 404, 408)
