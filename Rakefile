# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'rubygems'
require 'motion/project'
require 'bundler'

require 'motion-cocoapods'

require 'bubble-wrap'
require 'sugarcube'
require 'sugarcube-gestures'
require 'teacup'
require 'sweettea'
require 'geomotion'

require 'graymatter'

Bundler.require

Motion::Project::App.setup do |app|
  # Get our CocoaPods
  app.pods do
    pod 'ViewDeck'
  end

  # Use `rake config' to see complete project settings.
  app.name = 'Bring It On'
  app.deployment_target = '6.0'
  app.device_family = [:iphone]

  app.icons = ['Icon.png', 'Icon@2x.png', 'Icon-72.png', 'iTunesArtwork.png', 'iTunesArtwork@2x.png']
  app.prerendered_icon = true
  app.interface_orientations = [:portrait]
end