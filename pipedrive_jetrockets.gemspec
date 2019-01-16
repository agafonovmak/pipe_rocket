require 'rake'
Gem::Specification.new do |s|
  s.add_dependency "http"
  s.name        = 'pipedrive_jetrockets'
  s.version     = '0.0.77'
  s.date        = '2018-12-15'
  s.summary     = "Pipedrive API wrapper"
  s.description = "Pipedrive API wrapper"
  s.authors     = ["Agafonov Maksim"]
  s.require_paths = ['lib']
  s.email       = 'agafonov.maksim@jetrockets.ru'
  s.files       = FileList["app/*", "config/*", "lib/*", "lib/pipedrive_jetrockets/*", "app/controllers/pipedrive_jetrockets/*"]
  s.homepage    = 'http://rubygems.org/gems/hola'
  s.license      = 'MIT'
end
