class FindViewController < UIViewController

  stylesheet :find_screen

  def loadView
    super

    @challenges_list_controller = ChallengesListController.alloc.init
    @challenges_list = @challenges_list_controller.view

    self.addChildViewController(@challenges_list_controller)

    self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-denim.png'))
  end

  layout do
    find_text = subview(UIImageView, :text_find)

    subview(@challenges_list, :challenges_list)

    find_text.when_tapped do
      self.navigationController.presentViewController(ChallengesListController.alloc.init, animated: true, completion: nil)
    end
  end

end
