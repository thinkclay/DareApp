class FindViewController < UIViewController

  stylesheet :find_screen

  def loadView
    super

    # This will hold the JSON from the website
    @challenges_data = []

    AFMotion::Client.shared.get("challenges.json") do |result|
      if result.success?
        @challenges_data = result.object[:challenges]
      else
        p result.error.localizedDescription
      end
    end

    @challenge_details = layout(UIView, :modal_window)

    # Creating the table inline since it has many custom methods for styling
    @challenges_table = layout(UITableView, :challenges_table)
    @challenges_table.dataSource = self
    @challenges_table.delegate = self
    @challenges_table.backgroundColor = UIColor.clearColor
    @challenges_table.separatorColor = UIColor.clearColor
    @challenges_table.opaque = false
    @challenges_table.backgroundView = nil
  end

  def viewWillAppear(animated)
    @challenges_table.reloadData
  end

  layout :side do
    subview(UIImageView, :text_find)
    subview(@challenges_table, :challenges_list)

    subview(@challenge_details, :modal_window) do
      subview(UIImageView, :text_activity)
      subview(UIImageView, :background_modal)
      @details_title = subview(FXLabel, :details_title)
      @details_description = subview(UITextView, :details_description)
      @details_badge = subview(UIImageView, :details_badge)

      subview(UIImageView, :close_button).when_tapped do
        @challenge_details.move_to([0, Device.screen.height])
      end
    end
  end

  # Needed for the tableview to create the proper scroll size and cells
  def tableView(tableView, numberOfRowsInSection:section)
    @challenges_data.size
  end

  # Cell height is a fixed size, I would like it to be dynamic eventually, but this will do for now
  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    110
  end

  # Table cells get created here
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_identifier = 'challenge_cells'
    cell = tableView.dequeueReusableCellWithIdentifier(cell_identifier)

    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: cell_identifier)
      badge_image = UIImage.imageWithData(NSData.dataWithContentsOfURL(NSURL.URLWithString(@challenges_data[indexPath.row]["badge"])))

      layout(cell.contentView) do
        subview(UIImageView, :challenge_badge, image: badge_image)
        subview(FXLabel, :challenge_title, text: @challenges_data[indexPath.row]["title"].upcase)
        subview(FXLabel, :challenge_description, text: @challenges_data[indexPath.row]["summary"].downcase)
        subview(UIImageView, :cell_divider)
      end

      bgColorView = layout(UIView, :cell_background)
      cell.setSelectedBackgroundView(bgColorView)
    end

    cell
  end

  def tableView(tableView, willDisplayCell:cell, forRowAtIndexPath:indexPath)
    cell.backgroundColor = UIColor.clearColor
    cell.restyle!
    cell.apply_constraints
  end

  # Table Row Selection
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    @challenge_details.move_to([0, 0])

    @details_title.text = @challenges_data[indexPath.row]["title"].upcase
    @details_description.text = @challenges_data[indexPath.row]["description"]
    @details_badge.image = UIImage.imageWithData(NSData.dataWithContentsOfURL(NSURL.URLWithString(@challenges_data[indexPath.row]["badge"])))
  end

end
