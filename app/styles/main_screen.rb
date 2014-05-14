Teacup::Stylesheet.new :main_screen do

  import :global

  style :create_button,
    image: 'ui-btn-create.png'.uiimage,
    left: 29, top: 140,
    width: 291, height: 45

  style :find_button,
    image: 'ui-btn-find.png'.uiimage,
    left: 0, top: 250,
    width: 261, height: 45

  style :profile_button,
    image: 'ui-menu-profile.png'.uiimage,
    left: 20, top: (Device.screen.height - 110),
    width: 70, height: 70

  style :activity_button,
    image: 'ui-menu-activity.png'.uiimage,
    left: 125, top: (Device.screen.height - 110),
    width: 70, height: 70

  style :friends_button,
    image: 'ui-menu-friends.png'.uiimage,
    left: 230, top: (Device.screen.height - 110),
    width: 70, height: 70

  # profile modal
  style :text_profile,
    extends: :menu_header,
    image: 'txt-header-profile.png'.uiimage

  style :avatar,
    image: 'ph-avatar.png'.uiimage,
    left: 35, top: 55,
    width: 50, height: 50

  style :user_name,
    text: 'Clayton McIlrath',
    background: :clear.uicolor,
    color: BW.rgb_color(182, 164, 131),
    font: 'CabinSketch-Regular'.uifont(20),
    constraints: [
      constrain(:left).equals(:avatar, :right).plus(10),
      constrain(:top).equals(:avatar, :top).plus(2)
    ]

  style :user_location,
    text: 'Lafayette, CO',
    background: :clear.uicolor,
    color: BW.rgb_color(150, 130, 95),
    font: :system.uifont(14.0),
    constraints: [
      constrain(:left).equals(:avatar, :right).plus(10),
      constrain(:top).equals(:avatar, :top).plus(28)
    ]

  style :map_data,
    image: 'ph-map.png'.uiimage,
    width: 250, height: 129,
    constraints: [
      constrain(:left).equals(:avatar, :left),
      constrain(:top).equals(:user_location, :bottom).plus(15)
    ]


  style :map_overlay,
    image: 'profile-map-overlay.png'.uiimage,
    width: 250, height: 129,
    constraints: [
      constrain(:left).equals(:avatar, :left),
      constrain(:top).equals(:user_location, :bottom).plus(15)
    ]

  style :badges_earned,
    background: BW.rgba_color(55, 44, 31, 0.4),
    contentSize: CGSizeMake(250, 500),
    width: 250, height: 129,
    left: 35, top: 258

  style :badge,
    width: 75, height: 100

  style :badge_chinup,
    extends: :badge,
    image: 'ph-badge-chinup.png'.uiimage,
    left: 6, top: 0

  style :badge_green,
    extends: :badge,
    image: 'ph-badge-green.png'.uiimage,
    constraints: [
      constrain(:left).equals(:badge_chinup, :right).plus(6),
      constrain(:top).equals(:badge_chinup, :top)
    ]

  style :badge_drunk,
    extends: :badge,
    image: 'ph-badge-drunk.png',
    constraints: [
      constrain(:left).equals(:badge_green, :right).plus(6),
      constrain(:top).equals(:badge_chinup, :top)
    ]

  style :badges_overlay,
    image: 'profile-badges-overlay.png'.uiimage,
    width: 250, height: 22,
    constraints: [
      constrain(:left).equals(:avatar, :left),
      constrain(:bottom).equals(:badges_earned, :bottom)
    ]

  style :btn_friends,
    image: 'ui-btn-friends.png'.uiimage,
    width: 110, height: 29,
    constraints: [
      constrain(:bottom).equals(:modal_window, :bottom).minus(38),
      constrain(:left).equals(:modal_window, :left).plus(38)
    ]

  style :btn_coins,
    image: 'ui-btn-coins.png'.uiimage,
    width: 110, height: 29,
    constraints: [
      constrain(:bottom).equals(:modal_window, :bottom).minus(38),
      constrain(:right).equals(:modal_window, :right).minus(38)
    ]

  # activity window
  style :text_activity,
    extends: :menu_header,
    image: 'txt-header-activity.png'.uiimage

  # friends window
  style :text_friends,
    extends: :menu_header,
    image: 'txt-header-friends.png'.uiimage

end
