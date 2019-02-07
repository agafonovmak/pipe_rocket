Pipedrive API wrapper for Ruby on Rails.

# Installation
Add this line to your application's Gemfile:

``` Ruby
gem 'pipe_rocket'
```

And then execute:

```
bundle
```

Or install it yourself as:

```
gem install pipe_rocket
```

# Setup
``` Ruby
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
## PipeRocket::Deal
```ruby
deal = Pipedrive.deals.find([id]) #PipeRocket::Deal object

deal.files #File objects, attached to deal, including files from email messages.
deal.files.first.url #File object has S3 url by which you can directly download file from Amazon.

deal.stage #returns Pipeline::Stage object
deal.display_stage_name #returns deal stage(e.g. Sales:Contact Made)
```
## Pipeline::Stage
```ruby
stage = Pipedrive.stages.find([id]) #PipeRocket::Stage object

stage.display_name #stage name(e.g. Sales:Contact Made)

stage.pipeline #Pipedrive::Pipeline object
```
## Methods

All api methods returns Pipedrive::Entity heir objects. They have attr_accessor methods for all fields, returned by API. Custom fields can be accessed by their name(not key) or by name specified in CUSTOM_FIELD_NAMES. 

Via Pipedrive class you can work with the following models: 
 - deals
 - deal_fields
 - notes
 - organizations
 - organization_fields
 - persons
 - person_fields
 - pipelines
 - stages

 
## Get all records
``` Ruby
Pipedrive.deals.all
```

## Get record by id
``` Ruby
Pipedrive.deals.find([id])
```

## Create record
``` Ruby
Pipedrive.deals.create([hash])
```

## Update record
``` Ruby
Pipedrive.deals.update([hash])
```

## Get persons by email
``` Ruby
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
``` Ruby
#config/initializers/events.rb

ActiveSupport::Notifications.subscribe '[object]_[action]' do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  [object] = event.payload[:[object]] #PipeRocket::[object] object
end

e.g

ActiveSupport::Notifications.subscribe 'deal_updated' do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  deal = event.payload[:deal] #PipeRocket::Deal object
end
```

This will work with deal, note, organization, person, pipeline, stage, user objects and all event actions.

# Exceptions
If there is no connection or Pipedrive API returns error code, gem raises PipeRocket::Error. Error object has field *code* which contains HTTP error code(e.g. 400, 404, 408)


# Credits
Sponsored by [JetRockets](http://www.jetrockets.pro/).

![enter image description here](https://camo.githubusercontent.com/034460a54d8671d0d7e5743540613d26e27f16b7/687474703a2f2f6a6574726f636b6574732e70726f2f6a6574726f636b6574732d77686974652e706e67)

# License
Please see [LICENSE](https://github.com/agafonovmak/pipe_rocket/blob/master/LICENSE) for licensing details.
