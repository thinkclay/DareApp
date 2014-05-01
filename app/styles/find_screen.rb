#
# Find Screen Styles
#
# Styles that relate to the left column
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#


Teacup::Stylesheet.new :find_screen do

  style :text_find,
    left: 25,
    top: 20,
    width: 250,
    height: 20,
    image: UIImage.imageNamed('txt-header-find.png')

  style :find_screen,
    top: 50

end
