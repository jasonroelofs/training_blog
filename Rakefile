#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'cucumber/rake/task'

TrainingBlog::Application.load_tasks

task :default => "test:all"

namespace :test do
  task :all => ["test:units", "test:functionals", "test:features", "test:features_ar"]

  desc "Run the cucumber features"
  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format progress"
  end

  desc "Run cucumber features under ActiveRecord"
  Cucumber::Rake::Task.new(:features_ar) do |t|
    t.cucumber_opts = "features --format progress REPOSITORY=active_record"
  end
end
