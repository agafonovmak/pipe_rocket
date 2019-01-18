Rails.application.routes.draw do
  scope '/pipedrive' do
    post '/:object/:event' => 'pipe_rocket/events#handle'
  end
end
