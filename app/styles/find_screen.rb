Teacup::Stylesheet.new :find_screen do

  import :global

  style :challenges_table,
    backgroundView: nil,
    separatorColor: :clear.uicolor,
    frame: [[0, 47], [Device.screen.width - 25, Device.screen.height - 47]],
    backgroundColor: :clear.uicolor,
    opaque: false

  style :cell_background,
    background: TRANSPARENT_CREAM

  style :cell_divider,
    image: 'cell-divider.png'.uiimage,
    left: 6, bottom: 0,
    width: 280, height: 1

  style :challenge_title,
    extends: :h2,
    background: :clear.uicolor,
    color: LIGHT_CREAM,
    width: 265, height: 40,
    left: 15, top: 0

  style :challenge_badge,
    left: 12, top: 40,
    width: 50, height: 50

  style :challenge_description,
    background: :clear.uicolor,
    color: CREAM,
    font: 'Raleway-Light'.uifont(12),
    lineSpacing: 0.3, numberOfLines: 0,
    left: 70, top: 32,
    height: 63, width: 205

  # Modal Window
  style :modal_background,
    left: 7

  style :close_button,
    left: 265,
    top: 13

  style :details_title,
    extends: :h2,
    numberOfLines: 0,
    background: :clear.uicolor,
    color: BW.rgb_color(78, 50, 19),
    height: 40, width: 255,
    left: 20, top: 50

  style :details_description,
    extends: :p,
    editable: false,
    height: 150, width: 255,
    left: 15, top: 80

  style :details_badge,
    alpha: 0.1,
    height: 180, width: 180,
    center_x: '46%', top: 80

end
