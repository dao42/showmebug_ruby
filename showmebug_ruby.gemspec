# -*- encoding: utf-8 -*-
require "./lib/showmebug_ruby/version"

Gem::Specification.new do |s|
  s.name        = 'showmebug_ruby'
  s.version     = AuthingRuby::VERSION
  s.summary     = "ShowMeBug 的 Ruby SDK"
  s.description = "ShowMeBug 的 Ruby SDK"

  s.required_ruby_version = '>= 2.5'

  s.authors     = ["Rina"]
  s.email       = ['rina@gmail.com']
  s.files       = Dir['lib/**/*', 'showmebug_ruby.gemspec']

  # 运行时依赖
  s.add_runtime_dependency 'minitest', ['~> 5.14', '>= 5.14.4']
  s.add_runtime_dependency 'faraday', ['~> 1.4', '>= 1.4.3']
  s.add_runtime_dependency 'http', ['~> 5.0', '>= 5.0.1']
  s.add_runtime_dependency 'jwt', ['~> 2.2', '>= 2.2.3']
  s.add_runtime_dependency 'uri-query_params', ['~> 0.7.2']
  s.add_runtime_dependency 'logging', ['~> 2.3']

  # 开发时依赖
  s.add_development_dependency 'dotenv', ['~> 2.7', '>= 2.7.6']
  s.add_development_dependency 'rake', ['~> 13.0', '>= 13.0.3']

  s.homepage    = 'https://github.com/dao42/showmebug_ruby'
  s.license     = 'MIT'
end
