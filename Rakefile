# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'
require 'bundler'
require 'motion-cocoapods'

Bundler.setup
Bundler.require

require 'afmotion'
require 'bubble-wrap/all'
require 'sugarcube'
require 'sugarcube-gestures'
require 'sugarcube-repl'
require 'teacup'
require 'sweettea'
require 'geomotion'

require 'graymatter'

require 'map-kit-wrapper'

Motion::Project::App.setup do |app|

  # Analytics
  app.vendor_project(
    'vendor/Pods/NewRelicAgent/NewRelic_iOS_Agent_1.328/NewRelicAgent.framework',
    :static,
    :products => ['NewRelicAgent'],
    :headers_dir => 'Headers'
  )

  # Inspector
  app.vendor_project(
    'vendor/SparkInspector.framework',
    :static,
    :products => ['SparkInspector'],
    :headers_dir => './Headers'
  )

  # Get our CocoaPods
  app.pods do
    pod 'AFNetworking'
    pod 'NewRelicAgent'
    pod 'ViewDeck'
  end

  # Use `rake config' to see complete project settings.
  app.name = 'Bring It On'
  app.identifier = "com.thinkclay.bring-it-on"

  app.deployment_target = '6.1'
  app.provisioning_profile = '/Users/clay/Library/MobileDevice/Provisioning Profiles/B6FD73E2-3462-453F-99A8-C4F1F76ADE14.mobileprovision'
  app.device_family = [:iphone]

  app.frameworks += ['Social', 'Twitter', 'CoreLocation', 'MapKit', 'QuartzCore']
  app.libs << "/usr/lib/libz.dylib"

  app.icons = ['Icon.png', 'Icon@2x.png', 'Icon-72.png', 'iTunesArtwork.png', 'iTunesArtwork@2x.png']
  app.fonts = ['CabinSketch-Bold.ttf', 'CabinSketch-Regular.ttf']
  app.prerendered_icon = true
  app.interface_orientations = [:portrait]
end