# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")

require 'rubygems'
require 'motion/project'
require 'bundler'
require 'motion-cocoapods'
require 'motion/project'
require 'motion-require'

Motion::Require.all
Bundler.require

require 'bubble-wrap'
require 'sugarcube'
require 'sugarcube-gestures'
require 'teacup'
require 'sweettea'
require 'geomotion'

require 'graymatter'

require 'map-kit-wrapper'

Motion::Project::App.setup do |app|

  # app.detect_dependencies = false

  app.vendor_project(
    'vendor/Pods/NewRelic_iOS_Agent_1.309/NewRelicAgent.framework',
    :static,
    :products => ['NewRelicAgent'],
    :headers_dir => 'Headers'
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

  app.deployment_target = '6.0'
  app.device_family = [:iphone]
  app.frameworks += ['Social', 'Twitter', 'CoreLocation', 'MapKit']

  app.icons = ['Icon.png', 'Icon@2x.png', 'Icon-72.png', 'iTunesArtwork.png', 'iTunesArtwork@2x.png']
  app.fonts = ['CabinSketch-Bold.ttf', 'CabinSketch-Regular.ttf']
  app.prerendered_icon = true
  app.interface_orientations = [:portrait]
end