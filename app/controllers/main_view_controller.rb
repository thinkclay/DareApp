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

  def viewDidLoad
    if ( UIScreen.mainScreen.bounds.size.height == 480 )
      view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-octo.png'));
    else
      view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-octo-5.png'));
    end

    # Menu Buttons
    @button_create = UIImageView.alloc.initWithFrame([ [37, 100], [283, 45] ])
    @button_create.image = UIImage.imageNamed('ui-btn-create.png')

    @button_find = UIImageView.alloc.initWithFrame([ [0, 250], [255, 45] ])
    @button_find.image = UIImage.imageNamed('ui-btn-find.png')

    # Bottom Menu
    @menu_profile = UIImageView.alloc.initWithFrame([ [20, 370], [70, 70] ])
    @menu_profile.image = UIImage.imageNamed('ui-menu-profile.png')

    @menu_activity = UIImageView.alloc.initWithFrame([ [125, 370], [70, 70] ])
    @menu_activity.image = UIImage.imageNamed('ui-menu-activity.png')

    @menu_friends = UIImageView.alloc.initWithFrame([ [230, 370], [70, 70] ])
    @menu_friends.image = UIImage.imageNamed('ui-menu-friends.png')

    view.addSubview(@button_create)
    view.addSubview(@button_find)
    view.addSubview(@menu_profile)
    view.addSubview(@menu_activity)
    view.addSubview(@menu_friends)
  end

end