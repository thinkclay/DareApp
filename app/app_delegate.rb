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

    @left = UINavigationController.alloc.initWithRootViewController(FindViewController.new)
    @left.navigationBarHidden = true
    @left.viewControllers = [FindViewController.new]

    @right = UINavigationController.alloc.initWithRootViewController(CreateViewController.new)
    @right.navigationBarHidden = true
    @right.viewControllers = [CreateViewController.new]

    @center = UINavigationController.alloc.initWithRootViewController(MainViewController.new)
    @center.navigationBarHidden = true
    @center.viewControllers = [MainViewController.new]

    @deckViewController = IIViewDeckController.alloc.initWithCenterViewController(@center, leftViewController: @left, rightViewController: @right)
    @deckViewController.leftSize = 25
    @deckViewController.rightSize = 25

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = @deckViewController
    @window.makeKeyAndVisible

    return true
  end

end