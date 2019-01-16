module PipedriveJetrockets
  class EventsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def handle
      ActiveSupport::Notifications.instrument "#{params[:object]}_#{params[:action]}", {params[:object] => "PipedriveJetrockets::#{params[:object].titleize}".constantize.new(params[:current])}
    end
  end
end
