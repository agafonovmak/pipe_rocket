module PipeRocket
  class EventsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def handle
      ActiveSupport::Notifications.instrument "#{params[:object]}_#{params[:action]}", {params[:object] => "PipeRocket::#{params[:object].titleize}".constantize.new(params[:current])}
    end
  end
end
