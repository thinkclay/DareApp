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

end