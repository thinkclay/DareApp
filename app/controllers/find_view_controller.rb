#
# Find View Controller
#
# The Find a Challenge Menu
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#

class FindViewController < UIViewController

  stylesheet :find_screen

  def loadView
    super

    self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-denim.png'))
  end

  layout do
    find_text = subview(UIImageView, :text_find)
  end

end