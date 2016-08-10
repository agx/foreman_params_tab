# Tasks
namespace :foreman_params_tab do
  namespace :example do
    desc 'Example Task'
    task task: :environment do
      # Task goes here
    end
  end
end

# Tests
namespace :test do
  desc 'Test ForemanParamsTab'
  Rake::TestTask.new(:foreman_params_tab) do |t|
    test_dir = File.join(File.dirname(__FILE__), '../..', 'test')
    t.libs << ['test', test_dir]
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
    t.warning = false
  end
end

namespace :foreman_params_tab do
  task :rubocop do
    begin
      require 'rubocop/rake_task'
      RuboCop::RakeTask.new(:rubocop_foreman_params_tab) do |task|
        task.patterns = ["#{ForemanParamsTab::Engine.root}/app/**/*.rb",
                         "#{ForemanParamsTab::Engine.root}/lib/**/*.rb",
                         "#{ForemanParamsTab::Engine.root}/test/**/*.rb"]
      end
    rescue
      puts 'Rubocop not loaded.'
    end

    Rake::Task['rubocop_foreman_params_tab'].invoke
  end
end

Rake::Task[:test].enhance ['test:foreman_params_tab']

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task['jenkins:unit'].enhance ['test:foreman_params_tab', 'foreman_params_tab:rubocop']
end
