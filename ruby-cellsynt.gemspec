Gem::Specification.new do |s|
  s.name        = 'ruby-cellsynt'
  s.version     = '1.0.0'
  s.date        = '2021-06-22'
  s.licenses    = 'MIT'
  s.summary     = 'Cellsynt api'
  s.description = 'Ruby gem for interacting with the cellsynt api'
  s.authors     = ['beyarz']
  s.email       = ''
  s.files       = ['lib/ruby-cellsynt.rb']
  s.required_ruby_version = '>= 3.0.0'
  # s.add_dependency 'httparty', '~> 0.18.0'
  # s.add_development_dependency "rubocop", "~> 0.80.1"
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rdoc", "~> 6.2"
  s.add_development_dependency "rspec", "~> 3.9"
  s.homepage    = 'https://rubygems.org/gems/ruby-cellsynt'
  s.metadata    = { 'source_code_uri' => 'https://github.com/beyarz/ruby-cellsynt' }
end
