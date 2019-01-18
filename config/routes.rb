Rails.application.routes.draw do
  scope '/pipedrive' do
    post '/:object/:action' => 'piperocket/events#handle'
  end
end
