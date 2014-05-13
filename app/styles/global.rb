Teacup::Stylesheet.new :global do

  style :h1,
    left: 25,
    top: 15,
    width: 250,
    height: 20

  style :notice,
    image: UIImage.imageNamed('bg-notice.png'),
    height: 55,
    width: 280,
    left: 20,
    top: 40

  style :notice_content,
    numberOfLines: 3,
    text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam, accusamus error omnis repellendus nihil! Ea, porro, aspernatur, suscipit eaque unde nostrum sunt corporis cum error aperiam consequuntur fugit vel quae?',
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(118, 90, 59),
    font: UIFont.systemFontOfSize(12),
    height: 55,
    width: 260,
    left: 10,
    top: 0

  #
  # Modal Windows
  #
  style :modal_window,
    backgroundColor: UIColor.clearColor,
    height: Device.screen.height, width: Device.screen.width,
    left: 0, top: Device.screen.height

  style :background_modal,
    image: UIImage.imageNamed('bg-modal.png'),
    left: 20,
    top: 40

  style :menu_header,
    height: 20,
    width: 250,
    left: 30,
    top: 15

  style :close_button,
    image: UIImage.imageNamed('ui-close.png'),
    height: 22,
    width: 22,
    left: 280,
    top: 18

  #
  # Side Panels
  #
  style :side,
    background: UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-denim.png'))

end
