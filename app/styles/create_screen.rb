#
# Main Screen Styles
#
# Styles that relate to the right column
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#

Teacup::Stylesheet.new :create_screen do
  
  style :text_create,
    left: 24,
    top: 20,
    width: 250,
    height: 20,
    image: UIImage.imageNamed('txt-header-create.png')

  style :text_rules,
    left: 24, # Put it on the second page
    top: 20,
    width: 250,
    height: 20,
    image: UIImage.imageNamed('txt-header-create.png')
  
  style :pagination,
    left: 0,
    height: (Device.screen.height - 50),
    top: 0,
    width: (Device.screen.width)

  style :form_create,
    height: (Device.screen.height - 50),
    left: 25,
    top: 0,
    width: (Device.screen.width - 25)

  style :form_rules,
    height: (Device.screen.height - 50),
    width: (Device.screen.width - 25),
    top: 0,
    left: (Device.screen.width + 25)

  style :input_text_wrapper,
    left: 24,
    image: UIImage.imageNamed('ui-textfield-normal.png'),
    top: 50,
    userInteractionEnabled: true,
    width: 249

  style :challenge_name,
    color: BubbleWrap.rgb_color(118, 90, 59),
    height: 21,
    left: 8, 
    placeholder: 'Name of the Challenge',
    top: 5,
    width: 237

  style :paging,
    height: 18,
    image: UIImage.imageNamed('ui-bullet-normal.png'),
    width: 18

  style :page_1,
    extends: :paging,
    image: UIImage.imageNamed('ui-bullet-selected.png'),
    top: (Device.screen.height - 50),
    left: 122

  style :page_2,
    extends: :paging,
    constraints: [
      constrain(:top).equals(:page_1, :top),
      constrain(:left).equals(:page_1, :right).plus(8)
    ]

  style :page_3,
    extends: :paging,
    constraints: [
      constrain(:top).equals(:page_2, :top),
      constrain(:left).equals(:page_2, :right).plus(8)
    ]

  style :page_4,
    extends: :paging,
    constraints: [
      constrain(:top).equals(:page_3, :top),
      constrain(:left).equals(:page_3, :right).plus(8)
    ]

end