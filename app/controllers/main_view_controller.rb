#
# Main View Controller
#
# This controller is the middle, main screen that is shown on startup.
# It contains navigation elements for the side menus as well as profile, activity, and friends
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#

class MainViewController < UIViewController

  stylesheet :main_screen

  def loadView
    super

    if ( Device.screen.height == 480 )
      self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-octo.png'));
    else
      self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-octo-5.png'));
    end

    @profile = UIView.alloc.initWithFrame([[Device.screen.width, Device.screen.height], [Device.screen.width, Device.screen.height]])
    @profile.backgroundColor = UIColor.blueColor
  end

  layout do
    # Navigation
    create_button = subview(UIImageView, :create_button)
    find_button = subview(UIImageView, :find_button)
    profile_button = subview(UIImageView, :profile_button)
    activity_button = subview(UIImageView, :activity_button)
    friends_button = subview(UIImageView, :friends_button)

    modal_profile = subview(@profile, :modal_profile) do
      subview(UIImageView, :text_profile)
    end

    modal_activity = subview(UIView, :modal_activity)
    modal_friends = subview(UIView, :modal_friends)

    create_button.when_tapped do
      self.viewDeckController.toggleRightViewAnimated(true)
    end

    find_button.when_tapped do
      self.viewDeckController.toggleLeftViewAnimated(true)
    end

    profile_button.when_tapped do
      @profile.move_to([0, 100])
    end

    self.view.when_tapped do
      @profile.move_to([0, Device.screen.height])
    end

  end

end