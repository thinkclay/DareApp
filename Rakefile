# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'rubygems'
require 'motion/project'
require 'bundler'
require 'teacup'
require 'motion-cocoapods'
require 'bubble-wrap'
Bundler.require

Motion::Project::App.setup do |app|
  # Get our CocoaPods
  app.pods do
    dependency 'ViewDeck'
  end

  # Use `rake config' to see complete project settings.
  app.name = 'Bring It On'
  app.deployment_target = '6.0'
  app.icons << 'Icon.png'
  app.prerendered_icon = true
  app.interface_orientations = [:portrait]
end