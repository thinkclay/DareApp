class FindViewController < UIViewController

  stylesheet :find_screen

  def loadView
    super

    @challenges = ChallengesListController.alloc.init
    self.addChildViewController(@challenges)
  end

  layout :side do
    subview(FXLabel, :h1, text: 'FIND A CHALLENGE')
    subview(@challenges.view, :challenges_table)
  end

end
