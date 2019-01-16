Rails.application.routes.draw do
  scope '/pipedrive' do
    post '/:object/:action' => 'pipedrive_jetrockets/events#handle'
  end
end
