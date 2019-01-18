module PipeRocket
  class EventsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def handle
      ActiveSupport::Notifications.instrument "#{params[:object]}_#{params[:event]}", {params[:object].to_sym => "PipeRocket::#{params[:object].titleize}".constantize.new(params[:current])}
    end
  end
end
