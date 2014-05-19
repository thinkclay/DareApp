class MainViewController < UIViewController

  include Interface

  stylesheet :main_screen

  def loadView
    super

    # Used to set the custom drop shadow
    self.viewDeckController.delegate = self

    if ( Device.screen.height == 480 )
      self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-octo.png'));
    else
      self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-octo-5.png'));
    end

    # Custom in app notices
    AFMotion::Client.shared.get("challenges.json") do |result|
      if result.success?
        subview(UIImageView, :notice) do
          @notice = subview(UILabel, :notice_content)
        end

        @notice.text = "The user Dare just created a new challenge: #{result.object[:challenges][0][:title]}, click here to view and compete!"
      else
        p result.error.localizedDescription
      end
    end

    @profile = layout(UIView, :modal_window)
    @activity = layout(UIView, :modal_window)
    @friends = layout(UIView, :modal_window)
  end

  layout do
    # Navigation
    create_button = subview(UIImageView, :create_button)
    find_button = subview(UIImageView, :find_button)
    profile_button = subview(UIImageView, :profile_button)
    activity_button = subview(UIImageView, :activity_button)
    friends_button = subview(UIImageView, :friends_button)

    create_modal(@profile, header: 'PROFILE') do
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

    create_modal(@activity, header: 'ACTIVITY')
    create_modal(@friends, header: 'FRIENDS')

    create_button.when_tapped do
      self.viewDeckController.toggleRightViewAnimated(true)
    end

    find_button.when_tapped do
      self.viewDeckController.toggleLeftViewAnimated(true)
    end

    profile_button.when_tapped { show_modal(@profile) }
    activity_button.when_tapped { show_modal(@activity) }
    friends_button.when_tapped { show_modal(@friends) }

    @coins.when_tapped do
      self.navigationController.pushViewController(MapViewController.alloc.init, animated: true)
    end

  end

  # Used to set the custom drop shadow
  def viewDeckController(viewDeckController, applyShadow:shadowLayer, withBounds:rect)
    shadowLayer.masksToBounds = false
    shadowLayer.shadowRadius = 5;
    shadowLayer.shadowOpacity = 0.9;
    shadowLayer.shadowColor = UIColor.blackColor.CGColor
    shadowLayer.shadowOffset = CGSizeZero;
    shadowLayer.shadowPath = UIBezierPath.bezierPathWithRect(rect).CGPath
  end

end
