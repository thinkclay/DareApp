#
# Main View Controller
#
# This controller is the middle, main screen that is shown on startup.
# It contains navigation elements for the side menus as well as profile, activity, and friends
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#

class AuthViewController < UIViewController

  stylesheet :auth_screen

  def loadView
    super

    if ( Device.screen.height == 480 )
      self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-octo.png'));
    else
      self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-octo-5.png'));
    end
  end

  layout do
    BW::HTTP.post('http://thinkclay.com', {payload: {'foo' => 'bar'}}) do |response|
      puts response
    end

    @window = UIView.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    subview(@window, :window) do
      subview(UILabel, :welcome)

      subview(UIImageView, :btn_facebook)
      subview(UIImageView, :btn_gplus)
      subview(UIImageView, :btn_twitter)
      subview(UIImageView, :btn_linkedin)
      subview(UIImageView, :btn_foursquare)
    end
  end
end