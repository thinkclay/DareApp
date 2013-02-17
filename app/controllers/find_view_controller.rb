#
# Find View Controller
#
# The Find a Challenge Menu
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  Clayton McIlrath (c) 2013 
#
class FindViewController < UIViewController
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad   
    view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-denim.png'))
     
    @text_find = UIImageView.alloc.initWithFrame([ [20, 20], [250, 20] ])
    @text_find.image = UIImage.imageNamed('txt-header-find.png')

    view.addSubview(@text_find)
  end

end