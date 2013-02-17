#
# Create View Controller
#
# The Create a Challenge Menu
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  Clayton McIlrath (c) 2013 
#
class CreateViewController < UIViewController

  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad   
    view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-denim.png'))
    
    @text_create = UIImageView.alloc.initWithFrame([ [45, 20], [250, 20] ])
    @text_create.image = UIImage.imageNamed('txt-header-create.png')

    view.addSubview(@text_create)
  end

end