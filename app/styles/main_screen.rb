#
# Main Screen Styles
#
# Styles that relate to the middle column
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#

Teacup::Stylesheet.new :main_screen do

  style :create_button,
    left: 29,
    height: 45,
    image: UIImage.imageNamed('ui-btn-create.png'),
    top: 100,
    width: 291

  style :find_button,
    left: 0,
    height: 45,
    image: UIImage.imageNamed('ui-btn-find.png'),
    top: 250,
    width: 261

  style :profile_button,
    left: 20,
    height: 70,
    image: UIImage.imageNamed('ui-menu-profile.png'),
    top: (Device.screen.height - 110),
    width: 70

  style :activity_button,
    left: 125,
    height: 70,
    image: UIImage.imageNamed('ui-menu-activity.png'),
    top: (Device.screen.height - 110),
    width: 70

  style :friends_button,
    left: 230,
    height: 70,
    image: UIImage.imageNamed('ui-menu-friends.png'),
    top: (Device.screen.height - 110),
    width: 70


  #
  # Modal Windows
  #

  # Universal
  style :modal_window,
    backgroundColor: UIColor.clearColor,
    height: Device.screen.height,
    left: 0,
    top: Device.screen.height,
    width: Device.screen.width

  style :menu_header,
    left: 34,
    height: 20,
    top: 21,
    width: 250

  # Universal
  style :background_modal,
    left: 20,
    image: UIImage.imageNamed('bg-modal.png'),
    top: 40

  style :modal_close,
    height: 20,
    right: 20,
    top: 25,
    width: 22

  # profile window
  style :text_profile,
    extends: :menu_header,
    image: UIImage.imageNamed('txt-header-profile.png')

  style :avatar,
    height: 50,
    image: UIImage.imageNamed('ph-avatar.png'),
    left: 30,
    top: 50,
    width: 50

  style :user_name,
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(182, 164, 131),
    font: UIFont.fontWithName('CabinSketch-Regular', size: 20),
    constraints: [
      constrain(:left).equals(:avatar, :right).plus(10),
      constrain(:top).equals(:avatar, :top).plus(2)
    ],
    text: 'Clayton McIlrath'

  style :user_location,
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(150, 130, 95),
    constraints: [
      constrain(:left).equals(:avatar, :right).plus(10),
      constrain(:top).equals(:avatar, :top).plus(28)
    ],
    font: UIFont.systemFontOfSize(14.0),
    text: 'Lafayette, CO'

  style :btn_friends,
    image: UIImage.imageNamed('ui-btn-friends.png'),
    constraints: [
      constrain(:bottom).equals(:modal_window, :bottom).minus(38),
      constrain(:left).equals(:modal_window, :left).plus(38)
    ],
    height: 29,
    width: 110

  style :btn_coins,
    image: UIImage.imageNamed('ui-btn-coins.png'),
    constraints: [
      constrain(:bottom).equals(:modal_window, :bottom).minus(38),
      constrain(:right).equals(:modal_window, :right).minus(38)
    ],
    height: 29,
    width: 110

  # activity window
  style :text_activity,
    extends: :menu_header,
    image: UIImage.imageNamed('txt-header-activity.png')

  # friends window
  style :text_friends,
    extends: :menu_header,
    image: UIImage.imageNamed('txt-header-friends.png')

end