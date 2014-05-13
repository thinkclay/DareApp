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
require 'sugarcube-common'
require 'teacup'
require 'sweettea'
require 'geomotion'

require 'graymatter'

require 'map-kit-wrapper'

Motion::Project::App.setup do |app|

  # Get our CocoaPods
  app.pods do
    pod 'AFNetworking'
    pod 'ViewDeck'
    pod 'Parse'
    pod 'FXLabel'
  end

  # Use `rake config' to see complete project settings.
  app.name = 'Dare'
  app.seed_id = "DAC62CF44G"
  app.identifier = "com.thinkclay.dare"
  # app.codesign_certificate = 'Apple Development IOS Push Services: com.thinkclay.dare'

  app.info_plist['UIStatusBarHidden'] = true
  app.info_plist['UIViewControllerBasedStatusBarAppearance'] = false


  # Needed for APN
  app.entitlements['application-identifier'] = app.seed_id + '.' + app.identifier
  app.entitlements['keychain-access-groups'] = [
    app.seed_id + '.' + app.identifier
  ]
  app.entitlements['aps-environment'] = 'development'
  app.entitlements['get-task-allow'] = true

  app.deployment_target = '7.0'
  app.provisioning_profile = './environment/Dare_Dev.mobileprovision'
  app.device_family = [:iphone]

  app.libs << '/usr/lib/libz.dylib'
  app.libs << '/usr/lib/libsqlite3.dylib'

  app.frameworks += [
    'Accounts',
    'AdSupport',
    'AudioToolbox',
    'CFNetwork',
    'CoreGraphics',
    'CoreLocation',
    'CoreText',
    'MapKit',
    'MobileCoreServices',
    'Twitter',
    'QuartzCore',
    'Security',
    'Social',
    'StoreKit',
    'SystemConfiguration'
  ]

  # For some reason.. i seem to need the cocoapod AND the vendor include. UGH.
  app.vendor_project('vendor/Parse.framework', :static, :products => ['Parse'], :headers_dir => 'Headers')

  app.icons = ['Icon.png', 'Icon@2x.png', 'Icon-72.png', 'iTunesArtwork.png', 'iTunesArtwork@2x.png']
  app.fonts = [
    'CabinSketch-Bold.ttf',
    'CabinSketch-Regular.ttf',
    'Raleway-Thin.ttf',
    'Raleway-ExtraLight.ttf',
    'Raleway-Light.ttf',
    'Raleway-Regular.ttf',
    'Raleway-Medium.ttf',
    'Raleway-SemiBold.ttf',
    'Raleway-Bold.ttf',
    'Raleway-ExtraBold.ttf',
    'Raleway-Heavy.ttf'
  ]
  app.prerendered_icon = true
  app.interface_orientations = [:portrait]

end
