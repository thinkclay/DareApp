#
# Create View Controller
#
# The Create a Challenge Menu
#
# @author     Clay McIlrath <thinkclay@gmail.com>
# @copyright  (c) 2013 Clayton McIlrath, All rights reserved
#

class CreateViewController < UIViewController

  include GM::KeyboardHandler

  stylesheet :create_screen

  attr_accessor :input_fields, :post_data

  # Create our parent declarations, instantiate, and set properties
  def loadView
    self.view = UIView.new
    self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('ui-bg-denim.png'))

    # This is the pagination wrapper which is a scroll view containing many more scroll views
    @pagination = UIScrollView.new
    @pagination.pagingEnabled = true
    @pagination.bounces = false

    @create_challenge = UIScrollView.new
    @challenge_types = Types.load(self)

    # A nice handy function from @colinta which will intercept our keyboard delegation
    # and do work for us, like making the scroll area larger to accommodate overlap and such
    prepare_keyboard_handler(@create_challenge)
  end

  # I still need to figure out if it's going to be best to leave this logic here,
  # where I create multiple child views and attach them to @pagination ... OR if
  # these should be moved out into their own controllers.. but then how will
  # keyboard delegation and other master -> child properties get passed?
  layout :root do

    @post_data = {}

    # assign our input fields to an array so we can loop through
    # and manage keyboard actions
    @input_fields = {
      'type' => UITextField,
      'name' => UITextField,
      'description' => UITextView,
      'location' => UITextField,
      'privacy' => UITextField,
    }

    subview(@pagination, :pagination) do

      subview(@create_challenge, :form_create) do
        subview(UIImageView, :text_create)

        @input_fields.each do |key, value|
          subview(UIView, :"input_text_#{key}") do
            # @input_fields[:"#{key}_bg"] = subview(UIImageView, :ui_text_normal)
            @input_fields[key] = subview(value, :"challenge_#{key}")
            subview(UIImageView, :ui_text_normal)
          end
        end

        # Pick a challenge type from the select field
        @input_fields['type'].when_tapped do
          if defined? @challenge_type_dropdown
            @challenge_type_dropdown.fade_in
          else
            @challenge_type_dropdown = subview(UIView, :select_dropdown) do
              @challenge_type_table = UITableView.alloc.init
              @challenge_type_table.delegate = @challenge_type_table.dataSource = self

              subview(@challenge_type_table, :input_select_type)
            end
          end
        end

        @input_fields['location'].when_tapped do
          self.navigationController.presentViewController(PlacesListController.alloc.init, animated: true, completion: nil)
        end

        subview(UIImageView, :btn_next_rules).when_tapped do
          self.switch_page(1) if self.post_data_status
        end
      end

      subview(UIScrollView, :form_rules) do
        subview(UIImageView, :text_rules)
      end

      subview(UIScrollView, :form_badge) do
        subview(UIImageView, :text_badge)
      end

      subview(UIScrollView, :form_share) do
        subview(UIImageView, :text_share)
        @share_facebook = subview(UIImageView, :button_share_facebook)
        @share_twitter = subview(UIImageView, :button_share_twitter)
      end

    end

    # pagination control
    @page = []

    4.times { |i|
      @page[i] = subview(UIImageView, :"page_#{i}")

      @page[i].when_tapped do
        self.switch_page(i)
      end
    }

    @input_fields.each { |key, value|
      value.delegate = self
    }

    self.view.when_tapped do
      @input_fields.each { |key, value|
        value.resignFirstResponder
      }
    end

    @share_facebook.when_tapped do
      Composer.new(self, "Facebook", "I just created a challenge!")
    end

    @share_twitter.when_tapped do
      Composer.new(self, "Twitter", "I just created a challenge!")
    end
  end

  # As the view is actually being called, lets attach our listeners
  def viewWillAppear(animated)
    super
    keyboard_handler_start
  end

  # Remove the keyboard listener
  def viewWillDisappear(animated)
    super
    keyboard_handler_stop
  end

  # Set the scroll areas to screen size so that they arent scrolling around like mad men
  # we all know that users dont know what the hell they're doing anyways, so we better compensate
  def viewWillLayoutSubviews
    @create_challenge.contentSize = CGSizeMake( (Device.screen.width - 25), (Device.screen.height - 50) )
    @pagination.contentSize = self.view.superview.bounds.size
  end

  # Override the textView method so that my "textareas" go to the next field on "return"
  def textView(textView, shouldChangeTextInRange:range, replacementText:text)
    if text.isEqualToString("\n")
      textView.resignFirstResponder
      textView.superview.superview.viewWithTag(textView.tag + 1).becomeFirstResponder
      self.navigationController.presentViewController(PlacesListController.alloc.init, animated: true, completion: nil)

      return false
    end

    return true
  end

  def textFieldShouldReturn(textfield)
    # textfield.superview.image = UIImage.imageNamed('ui-textfield-normal.png')

    next_tag = textfield.tag + 1;
    next_responder = textfield.superview.superview.viewWithTag(next_tag)

    if (next_responder)
      next_responder.becomeFirstResponder
    else
      textfield.resignFirstResponder
    end

    return false;
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @challenge_types.size
  end

  CellID = 'ChallengeTypes'
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewStylePlain, reuseIdentifier:CellID)
    index = indexPath.indexAtPosition(indexPath.length - 1)

    if index % 2 == 1
      cell.contentView.backgroundColor = BubbleWrap.rgb_color(44, 33, 20)
    else
      cell.contentView.backgroundColor = BubbleWrap.rgb_color(36, 27, 17)
    end

    cell.textLabel.backgroundColor = UIColor.clearColor
    cell.textLabel.text = @challenge_types[indexPath.row]['group']
    cell.textLabel.color = BubbleWrap.rgb_color(99, 73, 44)
    cell.textLabel.font = UIFont.systemFontOfSize(14)
    cell
  end

  def tableView(tableView, didHighlightRowAtIndexPath: indexPath)
    @input_fields['type'].text = @challenge_types[indexPath.row]['group']
    @post_data['category'] = @challenge_types[indexPath.row]['name']

    @challenge_type_dropdown.fade_out if defined? @challenge_type_dropdown
    # @input_fields['type'].superview.image = UIImage.imageNamed('ui-textfield-normal.png')
  end

  def post_data_status
    post_ready = true

    @input_fields.each { |k, v|
      @post_data[k] = v.text

      if v.text.nil?
        # only the regular text inputs recognize an imageview as a proper container
        # original_textfield = UIImage.imageNamed('ui-text-selected.png')
        # stretchy_textfield = original_textfield.resizableImageWithCapInsets(UIEdgeInsetsMake(4,6,6,4))
        # @input_fields[k].superview.image = stretchy_textfield

        post_ready = false
      end
    }

    if post_ready
      AFMotion::Client.shared.put('api/challenges/create', @post_data) { |result|
        if result.success?
          p result.object
        elsif result.failure?
          p result.error.localizedDescription
        end
      }
    end
  end

  def switch_page(i)
    # Loop through and set all the others to normal state
    @page.each { |page|
      page.image = UIImage.imageNamed('ui-bullet-normal.png')
    }

    # Set this one to selected state
    @page[i].image = UIImage.imageNamed('ui-bullet-selected.png')

    # Move the scroll view to the correct offset
    offset = Device.screen.width * @page[i].tag.to_i
    @pagination.setContentOffset(CGPointMake(offset, 0), animated: true)
  end

end