#
# Challenge Screen Styles
#
# Styles that relate to the left column
#
Teacup::Stylesheet.new :challenge_screen do

  style :root,
    background: UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-denim.png'))

  style :text_find,
    left: 25,
    top: 25,
    width: 250,
    height: 20,
    image: UIImage.imageNamed('txt-header-find.png')

end
