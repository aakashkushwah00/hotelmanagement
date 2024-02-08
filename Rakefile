# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks



namespace :resque do
    desc "Clear Resque queue"
    task :clear do
      require 'resque'
      Resque.queues.each { |queue| Resque.remove_queue(queue) }
      puts "All Resque queues cleared."
    end
end
  