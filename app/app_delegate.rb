#
# App Delegate
#
# Global delegation and handler. Creates our initial views and our ViewDeck which is responsible
# for the side menus and swiping magic
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#

class AppDelegate

  #
  # Application Launch
  #
  # our regions are defined as left, center, and right, which each contain a set of navigation views (for now) that will
  # contain many subviews for the region
  #
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    find = FindViewController.new
    create = CreateViewController.new
    main = MainViewController.new
    auth = AuthViewController.new
    map = MapViewController.new


    @left = UINavigationController.alloc.initWithRootViewController(find)
    @left.navigationBarHidden = true
    @left.viewControllers = [find]

    @right = UINavigationController.alloc.initWithRootViewController(create)
    @right.navigationBarHidden = true
    @right.viewControllers = [create]

    @center = UINavigationController.alloc.initWithRootViewController(main)
    @center.navigationBarHidden = true
    @center.viewControllers = [auth, map, main]

    @deckViewController = IIViewDeckController.alloc.initWithCenterViewController(@center, leftViewController: @left, rightViewController: @right)
    @deckViewController.leftSize = 25
    @deckViewController.rightSize = 25

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = (false) ? AuthViewController.alloc.init : @deckViewController
    @window.makeKeyAndVisible

    return true
  end

end