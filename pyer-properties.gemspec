# coding: utf-8

Gem::Specification.new do |s|
  s.name          = 'pyer-properties'
  s.version       = '1.0.2'
  s.author        = 'Pierre BAZONNARD'
  s.email         = ['pierre.bazonnard@gmail.com']
  s.homepage      = 'https://github.com/pyer/properties'
  s.summary       = 'Read a properties file. Keys are methods.'
  s.license       = 'MIT'

  s.files         = ['lib/pyer/properties.rb']
  s.executables   = []
  s.test_files    = []
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 3.4.0'

  s.add_development_dependency 'rake',     '>= 13.3.0'
  s.add_development_dependency 'minitest', '= 5.4.2'
end
