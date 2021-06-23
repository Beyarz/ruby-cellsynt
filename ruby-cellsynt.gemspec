Gem::Specification.new do |s|
  s.name        = 'ruby-cellsynt'
  s.version     = '1.0.0'
  s.date        = '2021-06-22'
  s.licenses    = 'MIT'
  s.summary     = 'Cellsynt api'
  s.description = 'Ruby gem for interacting with the Cellsynt api'
  s.authors     = ['beyarz']
  s.email       = 'beyar-123@live.com'
  s.files       = ['lib/cellsynt.rb']
  s.required_ruby_version = '>= 3.0.0'
  # s.add_dependency 'httparty', '~> 0.18.0'
  s.add_development_dependency "rubocop", "~> 1.17"
  s.homepage    = 'https://rubygems.org/gems/ruby-cellsynt'
  s.metadata    = { 'source_code_uri' => 'https://github.com/beyarz/ruby-cellsynt' }
end
