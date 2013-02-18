#
# Main View Controller
#
# This controller is the middle, main screen that is shown on startup.
# It contains navigation elements for the side menus as well as profile, activity, and friends
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  Clayton McIlrath (c) 2013 
#
class MainViewController < UIViewController

  stylesheet :main_screen

  def loadView
    self.view = UIImageView.alloc.init
  end

  layout do
    if ( Device.screen.height == 480 )
      view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-octo.png'));
    else
      view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-octo-5.png'));
    end


    # Navigation
    subview(UIImageView, :create_button)
    subview(UIImageView, :find_button)
    subview(UIImageView, :profile_button)
    subview(UIImageView, :activity_button)
    subview(UIImageView, :friends_button)
  end

end