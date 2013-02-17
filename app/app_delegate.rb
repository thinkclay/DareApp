#
# App Delegate
#
# Global delegation and handler. Creates our initial views and our ViewDeck which is responsible
# for the side menus and swiping magic
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  Clayton McIlrath (c) 2013 
#
class AppDelegate

  # Application Launch
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @findView = FindViewController.alloc.init
    @createView = CreateViewController.alloc.init
    @mainView = MainViewController.alloc.init
    @deckViewController = IIViewDeckController.alloc.initWithCenterViewController(@mainView, leftViewController: @findView, rightViewController: @createView)
    @deckViewController.leftSize = 25
    @deckViewController.rightSize = 25


    # UIDevice.currentDevice.model :: iPhone, iPad, iPhone Simulator
    # UIScreen.mainScreen.bounds.size.height
    # @alert = UIAlertView.alloc.initWithTitle(
    #   'Hello',
    #   message: (UIScreen.mainScreen.bounds.size.height.to_s),
    #   delegate: nil, 
    #   cancelButtonTitle: "OK", 
    #   otherButtonTitles: nil
    # )
    # @alert.show

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = @deckViewController
    @window.makeKeyAndVisible

    return true
  end

end