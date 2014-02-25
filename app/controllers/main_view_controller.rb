#
# Main View Controller
#
# This controller is the middle, main screen that is shown on startup.
# It contains navigation elements for the side menus as well as profile, activity, and friends
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
    @activity = UIView.alloc.initWithFrame([[Device.screen.width, Device.screen.height], [Device.screen.width, Device.screen.height]])
    @friends = UIView.alloc.initWithFrame([[Device.screen.width, Device.screen.height], [Device.screen.width, Device.screen.height]])
  end

  layout do

    BW::HTTP.get "https://dareyou.to/challenges.json" do |response|
      if response.ok?
        # Parse the json
        json = BW::JSON.parse(response.body.to_str)

        # Create the notice and add to screen
        subview(UIImageView, :notice) do
          @notice = subview(UILabel, :notice_content)
        end

        # Set the notice text to the title
        @notice.text = "The user Dare just created a new challenge: #{json[:challenges][0][:name]}, click here to view and compete!"
      elsif response.status_code.to_s =~ /40\d/
        App.alert("Login failed")
      else
        App.alert(response.error_message)
      end
    end


    # Navigation
    create_button = subview(UIImageView, :create_button)
    find_button = subview(UIImageView, :find_button)
    profile_button = subview(UIImageView, :profile_button)
    activity_button = subview(UIImageView, :activity_button)
    friends_button = subview(UIImageView, :friends_button)

    modal_profile = subview(@profile, :modal_window) do
      subview(UIImageView, :text_profile)
      subview(UIImageView, :background_modal)

      subview(UIImageView, :close_button).when_tapped do
        @profile.move_to([0, Device.screen.height])
      end

      subview(UIImageView, :avatar)
      subview(UILabel, :user_name)
      subview(UILabel, :user_location)

      subview(UIImageView, :map_data)
      subview(UIImageView, :map_overlay)

      subview(UIScrollView, :badges_earned) do
        subview(UIImageView, :badge_chinup)
        subview(UIImageView, :badge_green)
        subview(UIImageView, :badge_drunk)
      end
      subview(UIImageView, :badges_overlay)

      subview(UIImageView, :btn_friends)
      @coins = subview(UIImageView, :btn_coins)
    end

    modal_activity = subview(@activity, :modal_window) do
      subview(UIImageView, :text_activity)
      subview(UIImageView, :background_modal)

      subview(UIImageView, :close_button).when_tapped do
        @activity.move_to([0, Device.screen.height])
      end
    end

    modal_friends = subview(@friends, :modal_window) do
      subview(UIImageView, :text_friends)
      subview(UIImageView, :background_modal)

      subview(UIImageView, :close_button).when_tapped do
        @friends.move_to([0, Device.screen.height])
      end
    end

    create_button.when_tapped do
      self.viewDeckController.toggleRightViewAnimated(true)
    end

    find_button.when_tapped do
      self.viewDeckController.toggleLeftViewAnimated(true)
    end

    profile_button.when_tapped do
      @profile.move_to([0, 0])
    end

    activity_button.when_tapped do
      @activity.move_to([0, 0])
    end

    friends_button.when_tapped do
      @friends.move_to([0, 0])
    end

    @coins.when_tapped do
      self.navigationController.pushViewController(MapViewController.alloc.init, animated: true)
    end

  end

end