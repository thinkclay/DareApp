Teacup::Stylesheet.new :find_screen do

  import :global

  style :text_find,
    extends: :h1,
    image: UIImage.imageNamed('txt-header-find.png')

  style :challenges_table,
    frame: [[0, 47], [Device.screen.width - 25, Device.screen.height - 47]]

  style :cell_background,
    background: BubbleWrap.rgba_color(55, 44, 31, 0.5)

  style :cell_divider,
    image: UIImage.imageNamed('cell-divider.png'),
    height: 1,
    width: 280,
    bottom: 0,
    left: 5

  style :challenge_badge,
    left: 27,
    top: 45,
    width: 45,
    height: 45

  style :challenge_title,
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(118, 90, 59),
    font: UIFont.fontWithName('Raleway-Light', size: 11),
    height: 40,
    left: 25,
    top: 0,
    width: 250

  style :challenge_description,
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(148, 120, 89),
    font: UIFont.fontWithName('Raleway-Light', size: 10),
    lineSpacing: 0.3,
    numberOfLines: 0,
    left: 80,
    height: 55,
    top: 40,
    width: 185

  # Modal Window
  style :background_modal,
    left: 7

  style :close_button,
    left: 265,
    top: 13

  style :details_title,
    numberOfLines: 0,
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(78, 50, 19),
    font: UIFont.fontWithName('Raleway-Light', size: 11),
    height: 40,
    width: 255,
    left: 20,
    top: 40

  style :details_description,
    editable: false,
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(98, 70, 39),
    font: UIFont.fontWithName('Raleway-Light', size: 10),
    height: 150, width: 255,
    left: 15, top: 70

  style :details_badge,
    alpha: 0.1,
    height: 180, width: 180,
    center_x: '46%', top: 60

end
