# coding: utf-8
require File.expand_path('../lib/foreman_params_tab/version', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = 'foreman_params_tab'
  s.version     = ForemanParamsTab::VERSION
  #s.date        = Time.zone.today
  s.authors     = ['Guido Günther']
  s.email       = ['agx@sigxcpu.org']
  s.homepage    = 'https://github.com/agx/foreman_params_tab'
  s.summary     = 'Display params in host overview.'
  s.description = 'Display a list of params in the hosts overview.'

  s.files = Dir['{app,config,db,lib,locale}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'deface'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rdoc'
end
