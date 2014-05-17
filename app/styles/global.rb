Teacup::Stylesheet.new :global do

  EGGSHELL = BW.rgb_color(243, 234, 224)
  CREAM = BW.rgb_color(148, 120, 89)
  LIGHT_CREAM = BW.rgb_color(178, 150, 119)
  TRANSPARENT_CREAM = BW.rgba_color(55, 44, 31, 0.5)

  style :h1,
    backgroundColor: :clear.uicolor,
    color: CREAM,
    font: 'CabinSketch-Bold'.uifont(24),
    left: 15, top: 15,
    width: 250, height: 20

  style :h2,
    font: 'Raleway-Light'.uifont(13)

  style :p,
    background: :clear.uicolor,
    color: BW.rgb_color(98, 70, 39),
    font: 'Raleway-Light'.uifont(12)

  style :notice,
    image: 'bg-notice.png'.uiimage,
    left: 20, top: 40,
    width: 280, height: 55

  style :notice_content,
    numberOfLines: 3,
    background: :clear.uicolor,
    color: BW.rgb_color(118, 90, 59),
    font: :system.uifont(12),
    left: 10, top: 0,
    width: 260, height: 55

  # Modal Windows
  style :modal_window,
    backgroundColor: :clear.uicolor,
    left: 0, top: Device.screen.height,
    height: Device.screen.height, width: Device.screen.width

  style :modal_background,
    image: 'bg-modal.png'.uiimage,
    left: 10,
    top: 30

  style :modal_header,
    backgroundColor: :clear.uicolor,
    color: EGGSHELL,
    font: 'CabinSketch-Bold'.uifont(24),
    left: 30, top: 15,
    width: 250, height: 20

  style :close_button,
    image: 'ui-close.png'.uiimage,
    left: 280, top: 13,
    width: 22, height: 22

  # Side Panels
  style :side,
    background: 'ui-bg-denim.png'.uiimage.uicolor

end
