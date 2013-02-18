Teacup::Stylesheet.new :main_screen do
  
  style :create_button,
    left: 29, 
    height: 45,
    image: UIImage.imageNamed('ui-btn-create.png'),
    top: 100,
    width: 291

  style :find_button,
    left: 0, 
    height: 45,
    image: UIImage.imageNamed('ui-btn-find.png'),
    top: 250,
    width: 261

  style :profile_button,
    left: 20, 
    height: 70,
    image: UIImage.imageNamed('ui-menu-profile.png'),
    top: 370,
    width: 70

  style :activity_button,
    left: 125, 
    height: 70,
    image: UIImage.imageNamed('ui-menu-activity.png'),
    top: 370,
    width: 70

  style :friends_button,
    left: 230, 
    height: 70,
    image: UIImage.imageNamed('ui-menu-friends.png'),
    top: 370,
    width: 70

end