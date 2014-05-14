Teacup::Stylesheet.new :create_screen do

  import :global

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

  # Pagination
  style :pagination,
    left: 0, top: 0,
    width: Device.screen.width, height: (Device.screen.height - 50)

  style :paging,
    image: 'ui-bullet-normal.png'.uiimage,
    width: 18, height: 18

  style :page_0,
    extends: :paging,
    tag: 0,
    image: 'ui-bullet-selected.png'.uiimage,
    left: 122, top: (Device.screen.height - 50)

  style :page_1,
    extends: :paging,
    constraints: [
      constrain(:top).equals(:page_0, :top),
      constrain(:left).equals(:page_0, :right).plus(8)
    ],
    tag: 1

  style :page_2,
    extends: :paging,
    constraints: [
      constrain(:top).equals(:page_1, :top),
      constrain(:left).equals(:page_1, :right).plus(8)
    ],
    tag: 2

  style :page_3,
    extends: :paging,
    constraints: [
      constrain(:top).equals(:page_2, :top),
      constrain(:left).equals(:page_2, :right).plus(8)
    ],
    tag: 3

  #
  # Form fields for Challenge Creation
  #
  style :input_text_wrapper,
    image: 'ui-textfield-normal.png'.uiimage,
    userInteractionEnabled: true,
    left: 24,
    width: 249

  style :input_textarea_wrapper,
    image: 'ui-textarea-normal.png'.uiimage,
    userInteractionEnabled: true,
    left: 24,
    width: 249

  style :select_dropdown_wrapper,
    image: 'ui-dropdown.png'.uiimage,
    userInteractionEnabled: true,
    left: 49, top: 82,
    width: 249, height: 114

  style :input_text,
    placeholder: 'Nothing Set',
    color: BW.rgb_color(118, 90, 59),
    left: 8, top: 5,
    width: 237, height: 21

  style :input_textarea,
    background: :clear.uicolor,
    color: BW.rgb_color(118, 90, 59),
    font: :system.uifont(17),
    width: 245, height: 42,
    left: 0, top: 2

  # Challenge Type Select
  style :input_text_type,
    extends: :input_text_wrapper,
    tag: 1,
    top: 50

  style :input_select_type,
    separatorColor: BW.rgb_color(36, 27, 17),
    bounces: false,
    width: 247, height: 116,
    left: 1, top: 0

  style :challenge_type,
    extends: :input_text,
    placeholder: 'Challenge Type',
    returnKeyType: UIReturnKeyNext,
    tag: 1

  # Challenge Name Input
  style :input_text_name,
    extends: :input_text_wrapper,
    constraints: [
      constrain(:top).equals(:input_text_type, :bottom).plus(15)
    ]

  style :challenge_name,
    extends: :input_text,
    placeholder: 'Name of the Challenge',
    returnKeyType: UIReturnKeyNext,
    tag: 2

  #  Challenge Description Textarea
  style :input_text_description,
    extends: :input_textarea_wrapper,
    constraints: [
      constrain(:top).equals(:input_text_name, :bottom).plus(15)
    ]

  style :challenge_description,
    extends: :input_textarea,
    returnKeyType: UIReturnKeyNext,
    tag: 3

  # Challenge Location Select Window
  style :input_text_location,
    extends: :input_text_wrapper,
    constraints: [
      constrain(:top).equals(:input_text_description, :bottom).plus(15)
    ]

  style :challenge_location,
    extends: :input_text,
    placeholder: 'Start Location',
    returnKeyType: UIReturnKeyNext,
    tag: 4

  # Challenge Privacy
  style :input_text_privacy,
    extends: :input_text_wrapper,
    constraints: [
      constrain(:top).equals(:input_text_location, :bottom).plus(15)
    ]

  style :challenge_privacy,
    extends: :input_text,
    placeholder: 'Privacy',
    returnKeyType: UIReturnKeyGo,
    tag: 5


  style :btn_next_rules,
    image: 'btn_next_rules.png'.uiimage,
    constraints: [
      constrain(:top).equals(:input_text_privacy, :bottom).plus(15)
    ],
    left: 25,
    width: 145, height: 29

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
