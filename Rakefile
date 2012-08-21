#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TrainingBlog::Application.load_tasks

task :default => "test:all"

namespace :test do
  desc "Run the cucumber features"
  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format progress"
  end
end
