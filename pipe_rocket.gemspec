require 'rake'
Gem::Specification.new do |s|
  s.add_dependency "http"
  s.name        = 'pipe_rocket'
  s.version     = '0.0.1'
  s.date        = '2019-01-18'
  s.summary     = "Pipedrive API wrapper"
  s.description = "Pipedrive API wrapper"
  s.authors     = ["Agafonov Maksim"]
  s.require_paths = ['lib']
  s.email       = 'agafonov.maksim@jetrockets.ru'
  s.files       = FileList["app/*", "config/*", "lib/*", "lib/pipe_rocket/*", "app/controllers/pipe_rocket/*"]
  s.homepage    = 'https://github.com/agafonovmak/pipe_rocket/'
  s.license      = 'MIT'
end
