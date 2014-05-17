#
# App Delegate
#
# Global delegation and handler. Creates our initial views and our ViewDeck which is responsible
# for the side menus and swiping magic
#
class AppDelegate
  #
  # Application Launch
  #
  # our regions are defined as left, center, and right, which each contain a set of navigation views (for now) that will
  # contain many subviews for the region
  #
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Parse.setApplicationId("5va8t9YOgwLOrSBOXexVzZnVjSYWLl6h5AO7wldo", clientKey:"jl71OfhH0Lt32vJUAI5KiEsmNLQRo7QQe5bxOLlv")

    # Only do this on the device
    if Device.simulator?
      # SparkInspector.enableObservation
    else
      application.registerForRemoteNotificationTypes(UIRemoteNotificationTypeBadge)
    end

    UIApplication.sharedApplication.setStatusBarHidden true

    # Do an actual request to the site on load so we can update the instance var
    AFMotion::Client.build_shared("https://dareyou.to/") do
      header "Accept", "application/json"
      response_serializer :json
    end

    @find = FindViewController.new
    @create = CreateViewController.new
    @main = MainViewController.new
    @auth = AuthViewController.new
    @map = MapViewController.new

    @left = UINavigationController.alloc.initWithRootViewController(@find)
    @left.navigationBarHidden = true
    @left.viewControllers = [@find]

    @right = UINavigationController.alloc.initWithRootViewController(@create)
    @right.navigationBarHidden = true
    @right.viewControllers = [@create]

    @center = UINavigationController.alloc.initWithRootViewController(@main)
    @center.navigationBarHidden = true
    @center.viewControllers = [@auth, @map, @main]

    @deckViewController = IIViewDeckController.alloc.initWithCenterViewController(@center, leftViewController: @left, rightViewController: @right)
    @deckViewController.delegate = self
    @deckViewController.leftSize = 25
    @deckViewController.rightSize = 25

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = (false) ? AuthViewController.alloc.init : @deckViewController
    @window.makeKeyAndVisible

    true
  end

  def application(application, didRegisterForRemoteNotificationsWithDeviceToken:newDeviceToken)
    PFPush.storeDeviceToken(newDeviceToken)
    PFPush.subscribeToChannelInBackground("test")
  end

  def application(application, didFailToRegisterForRemoteNotificationsWithError:error)
    alert_log ("application:didFailToRegisterForRemoteNotificationsWithError: #{error.debugDescription}")
  end

  def application(application, didReceiveRemoteNotification:userInfo)
    alert_log ("a push has been received at #{Time.now}: #{userInfo}")
  end

  def alert_log(message)
    alert = UIAlertView.new
    alert.message = message
    alert.show
  end

end
