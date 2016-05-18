require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :update_locales do
  require_relative 'lib/locales_downloader.rb'
  LocalesDownloader.()
end
