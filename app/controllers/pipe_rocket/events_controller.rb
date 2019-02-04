module PipeRocket
  class EventsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def handle
      json = params[:current] || params[:previous]
      ActiveSupport::Notifications.instrument "#{params[:object]}_#{params[:event]}", {params[:object].to_sym => "PipeRocket::#{params[:object].titleize}".constantize.new(json)}
    end
  end
end
