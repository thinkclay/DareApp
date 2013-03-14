#
# Profile Screen Styles
#
# Styles that relate to the profile modal window
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#

Teacup::Stylesheet.new :menu_screen do

  # Headers
  style :menu_header,
    left: 34,
    height: 20,
    top: 21,
    width: 250

  style :text_profile,
    extends: :menu_header,
    image: UIImage.imageNamed('txt-header-profile.png')

  style :text_activity,
    extends: :menu_header,
    image: UIImage.imageNamed('txt-header-activity.png')

  style :text_friends,
    extends: :menu_header,
    image: UIImage.imageNamed('txt-header-friends.png')


  style :background_modal,
    left: 20,
    image: UIImage.imageNamed('bg-modal.png'),
    top: 40

end