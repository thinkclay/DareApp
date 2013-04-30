#
# Main Screen Styles
#
# Styles that relate to the right column
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#

Teacup::Stylesheet.new :create_screen do

  # Form Wrappers
  style :form,
    height: (Device.screen.height - 50),
    left: 25,
    top: 0,
    width: (Device.screen.width - 25)

  style :form_create,
    extends: :form

  style :form_rules,
    extends: :form,
    left: (Device.screen.width + 25)

  style :form_badge,
    extends: :form,
    left: (Device.screen.width*2 + 25)

  style :form_share,
    extends: :form,
    left: (Device.screen.width*3 + 25)

  # Headers
  style :create_header,
    left: 24,
    height: 20,
    top: 20,
    width: 250

  style :text_create,
    extends: :create_header,
    image: UIImage.imageNamed('txt-header-create.png')

  style :text_rules,
    extends: :create_header,
    image: UIImage.imageNamed('txt-header-rules.png')

  style :text_badge,
    extends: :create_header,
    image: UIImage.imageNamed('txt-header-badge.png')

  style :text_share,
    extends: :create_header,
    image: UIImage.imageNamed('txt-header-share.png')

  # Pagination
  style :pagination,
    left: 0,
    height: (Device.screen.height - 50),
    top: 0,
    width: (Device.screen.width)

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

  # Input Fields
  style :input_text_wrapper,
    left: 24,
    image: UIImage.imageNamed('ui-textfield-normal.png'),
    userInteractionEnabled: true,
    width: 249

  style :input_textarea_wrapper,
    left: 24,
    image: UIImage.imageNamed('ui-textarea-normal.png'),
    userInteractionEnabled: true,
    width: 249

  style :input_text_type,
    extends: :input_text_wrapper,
    tag: 1,
    top: 50

  style :input_text_name,
    extends: :input_text_wrapper,
    constraints: [
      constrain(:top).equals(:input_text_type, :bottom).plus(15)
    ]

  style :input_text_description,
    extends: :input_textarea_wrapper,
    constraints: [
      constrain(:top).equals(:input_text_name, :bottom).plus(15)
    ]

  style :input_text_location,
    extends: :input_text_wrapper,
    constraints: [
      constrain(:top).equals(:input_text_description, :bottom).plus(15)
    ]

  style :input_text_privacy,
    extends: :input_text_wrapper,
    constraints: [
      constrain(:top).equals(:input_text_location, :bottom).plus(15)
    ]

  style :btn_submit,
    image: UIImage.imageNamed('ui-btn-coins.png'),
    constraints: [
      constrain(:top).equals(:input_text_privacy, :bottom).plus(15)
    ],
    left: 25,
    height: 29,
    width: 110

  style :input_text,
    color: BubbleWrap.rgb_color(118, 90, 59),
    height: 21,
    left: 8,
    placeholder: 'Nothing Set',
    top: 5,
    width: 237

  style :input_textarea,
    background: UIColor.clearColor,
    color: BubbleWrap.rgb_color(118, 90, 59),
    font: UIFont.systemFontOfSize(17),
    height: 42,
    left: 0,
    placeholder: 'Nothing Set',
    top: 2,
    width: 245

  style :challenge_type,
    extends: :input_text,
    placeholder: 'Challenge Type',
    returnKeyType: UIReturnKeyNext,
    tag: 1

  style :challenge_name,
    extends: :input_text,
    placeholder: 'Name of the Challenge',
    returnKeyType: UIReturnKeyNext,
    tag: 2

  style :challenge_description,
    extends: :input_textarea,
    placeholder: 'Description',
    returnKeyType: UIReturnKeyNext,
    tag: 3

  style :challenge_location,
    extends: :input_text,
    placeholder: 'Start Location',
    returnKeyType: UIReturnKeyNext,
    tag: 4

  style :challenge_privacy,
    extends: :input_text,
    placeholder: 'Privacy',
    returnKeyType: UIReturnKeyGo,
    tag: 5

  # Social
  style :button_share_facebook,
    image: UIImage.imageNamed('ui-btn-facebook.png'),
    left: 24,
    top: 60

  style :button_share_twitter,
    image: UIImage.imageNamed('ui-btn-twitter.png'),
    constraints: [
      constrain(:left).equals(:button_share_facebook, :right).plus(8)
    ],
    top: 60

end