require 'erb'
require 'dice_bag/configuration'

desc "Configure the application from the environment"
task :config => 'config:all'

namespace :config do
  # This is an alias for plain 'config' that can be called unabiguously from
  # within other namespaces.
  task :all => ['config:db', 'config:eureka', 'config:mauth']

  desc "Create a database.yml file from database.yml.erb"
  task :db do
    DiceBag::Configuration.write('database.yml')
  end

  desc "Create eureka.yml file from eureka.yml.erb"
  task :eureka do
    DiceBag::Configuration.write('eureka.yml')
  end

  desc "Create a mauth_key and mauth.yml files from mauth_key.erb and mauth.yml.erb respectively"
  task :mauth do
    DiceBag::Configuration.write('mauth_key')
    DiceBag::Configuration.write('mauth.yml')
  end
end
