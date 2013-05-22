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
          subview(UIImageView, :"input_text_#{key}") do
            @input_fields[key] = subview(value, :"challenge_#{key}")
          end
        end

        @input_fields['type'].when_tapped do
          @pagination.setContentOffset(CGPointMake(0, -40), animated: true)

          plistPath = NSBundle.mainBundle.pathForResource("ChallengeTypes", ofType:"plist")
          controlData = NSArray.alloc.initWithContentsOfFile(plistPath)

          @horizontalSelect = KLHorizontalSelect.alloc.initWithFrame(self.view.bounds)
          @horizontalSelect.delegate = self
          @horizontalSelect.setTableData(controlData)
          subview(@horizontalSelect, :hs_challenge_type)
        end

        @input_fields['location'].when_tapped do
          self.navigationController.presentViewController(PlacesListController.alloc.init, animated: true, completion: nil)
        end

        subview(UIImageView, :btn_submit).when_tapped do
          @input_fields.each { |key, value|
            @post_data[key] = value.text
          }

          AFMotion::Client.shared.put('api/challenges/create', @post_data) do |result|
            if result.success?
              p result.object
            elsif result.failure?
              p result.error.localizedDescription
            end
          end
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
    @page_1 = subview(UIImageView, :page_1)
    @page_2 = subview(UIImageView, :page_2)
    @page_3 = subview(UIImageView, :page_3)
    @page_4 = subview(UIImageView, :page_4)

    @input_fields.each { |key, value|
      value.delegate = self
    }

    self.view.when_tapped do
      @horizontalSelect.removeFromSuperview if defined? @horizontalSelect

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

    @page_1.when_tapped do
      @page_1.image = UIImage.imageNamed('ui-bullet-selected.png')
      @page_2.image = UIImage.imageNamed('ui-bullet-normal.png')
      @page_3.image = UIImage.imageNamed('ui-bullet-normal.png')
      @page_4.image = UIImage.imageNamed('ui-bullet-normal.png')
      @pagination.setContentOffset(CGPointMake(0, 0), animated: true)
    end

    @page_2.when_tapped do
      @page_1.image = UIImage.imageNamed('ui-bullet-normal.png')
      @page_2.image = UIImage.imageNamed('ui-bullet-selected.png')
      @page_3.image = UIImage.imageNamed('ui-bullet-normal.png')
      @page_4.image = UIImage.imageNamed('ui-bullet-normal.png')
      @pagination.setContentOffset(CGPointMake(Device.screen.width, 0), animated: true)
    end

    @page_3.when_tapped do
      @page_1.image = UIImage.imageNamed('ui-bullet-normal.png')
      @page_2.image = UIImage.imageNamed('ui-bullet-normal.png')
      @page_3.image = UIImage.imageNamed('ui-bullet-selected.png')
      @page_4.image = UIImage.imageNamed('ui-bullet-normal.png')
      @pagination.setContentOffset(CGPointMake(Device.screen.width*2, 0), animated: true)
    end

    @page_4.when_tapped do
      @page_1.image = UIImage.imageNamed('ui-bullet-normal.png')
      @page_2.image = UIImage.imageNamed('ui-bullet-normal.png')
      @page_3.image = UIImage.imageNamed('ui-bullet-normal.png')
      @page_4.image = UIImage.imageNamed('ui-bullet-selected.png')
      @pagination.setContentOffset(CGPointMake(Device.screen.width*3, 0), animated: true)
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
      return false
    end

    return true
  end

  def textFieldShouldReturn(textfield)
    next_tag = textfield.tag + 1;
    next_responder = textfield.superview.superview.viewWithTag(next_tag)

    if (next_responder)
      next_responder.becomeFirstResponder
    else
      textfield.resignFirstResponder
    end

    return false;
  end

  def horizontalSelect(horizontalSelect, didSelectCell:cell)
    @input_fields['type'].text = cell.label.text
  end

end