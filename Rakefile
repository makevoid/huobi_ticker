# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'huobi_ticker'
  
  # app.deployment_target = '5.1'
  
  # app.pods do
  #   pod 'AFNetworking'
  # end
  
  app.frameworks += ['MediaPlayer']
  
end

desc "Clean the vendor build folder"
task :vendorclean => [:clean] do
  sh "rm", "-rf", "vendor/build"
  sh "rm", "-rf", "vendor/Pods"
end


task :run => [:default]
