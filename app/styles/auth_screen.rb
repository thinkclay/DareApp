Teacup::Stylesheet.new :auth_screen do

  style :window,
    background: BubbleWrap.rgba_color(216, 115, 41, 0.7)

  style :welcome,
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(182, 164, 131),
    font: UIFont.fontWithName('CabinSketch-Regular', size: 20),
    constraints: [
      constrain(:left).equals(:window, :left).plus(10),
    ],
    text: 'Clayton McIlrath',
    textAlignment: UITextAlignmentCenter,
    top: 20

  style :btn_facebook,
    image: UIImage.imageNamed('btn_facebook.png'),
    left: 30,
    top: 200

  style :btn_gplus,
    image: UIImage.imageNamed('btn_gplus.png'),
    constraints: [
      constrain(:left).equals(:btn_facebook, :right).plus(30),
      constrain(:top).equals(:btn_facebook, :bottom)
    ]

  style :btn_twitter,
    image: UIImage.imageNamed('btn_twitter.png'),
    constraints: [
      constrain(:left).equals(:btn_facebook, :left),
      constrain(:top).equals(:btn_gplus, :bottom)
    ]

  style :btn_linkedin,
    image: UIImage.imageNamed('btn_linkedin.png'),
    constraints: [
      constrain(:left).equals(:btn_gplus, :left),
      constrain(:top).equals(:btn_twitter, :bottom)
    ]

  style :btn_foursquare,
    image: UIImage.imageNamed('btn_foursquare.png'),
    constraints: [
      constrain(:left).equals(:btn_facebook, :left),
      constrain(:top).equals(:btn_linkedin, :bottom)
    ]

end
