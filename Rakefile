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
  
  app.info_plist['env'] = "alpha"
  
  # app.deployment_target = '5.1'
  # 
  # app.sdk_version = "5.1" # rake device install_only=1 # dev, you know I have ipad 1
  
  app.sdk_version = "7.0"
  app.identifier = "com.makevoid.huobi-ticker"     
  #app.codesign_certificate = "iPhone Distribution: makevoid inc"
  
  # app.pods do
  #   pod 'AFNetworking'
  # end
  
  app.frameworks += ['MediaPlayer']
  
  app.provisioning_profile = '/Users/makevoid/Dropbox/ios_development/Huobi.mobileprovision'
  
  
  
  #app.provisioning_profile = '/Users/makevoid/Library/MobileDevice/Provisioning Profiles/6B2910E9-A0A7-4430-A490-FF220FE287CD.mobileprovision'

end

desc "Clean the vendor build folder"
task :vendorclean => [:clean] do
  sh "rm", "-rf", "vendor/build"
  sh "rm", "-rf", "vendor/Pods"
end


task :run => [:default]
