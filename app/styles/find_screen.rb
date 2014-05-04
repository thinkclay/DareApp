#
# Find Screen Styles
#
# Styles that relate to the left column
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#


Teacup::Stylesheet.new :find_screen do

  style :root,
    background: UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-denim.png'))

  style :text_find,
    left: 25,
    top: 20,
    width: 250,
    height: 20,
    image: UIImage.imageNamed('txt-header-find.png')

  style :challenge_badge,
    left: 10,
    top: 15,
    width: 45,
    height: 45

  style :challenge_title,
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(118, 90, 59),
    font: UIFont.systemFontOfSize(12),
    height: 30,
    left: 65,
    top: 0,
    width: 212

  style :challenge_description,
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(148, 120, 89),
    font: UIFont.systemFontOfSize(10),
    left: 65,
    height: 55,
    numberOfLines: 4,
    top: 22,
    width: 212

end
