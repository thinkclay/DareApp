class FindViewController < UIViewController

  stylesheet :find_screen

  def loadView
    super

    @data = []

    AFMotion::Client.shared.get("challenges.json") do |result|
      if result.success?
        @data = result.object[:challenges]
      else
        p result.error.localizedDescription
      end
    end

    @details = layout(UIView, :modal_window)
    @table = layout(UITableView, :challenges_table, delegate: self, dataSource: self)
  end

  def viewWillAppear(animated)
    @table.reloadData
  end

  layout :side do
    subview(FXLabel, :h1, text: 'FIND A CHALLENGE')
    subview(@table, :challenges_list)

    subview(@details, :modal_window) do
      subview(UIImageView, :text_activity)
      subview(UIImageView, :modal_background)
      @details_title = subview(FXLabel, :details_title)
      @details_description = subview(UITextView, :details_description)
      @details_badge = subview(UIImageView, :details_badge)

      subview(UIImageView, :close_button).when_tapped do
        @details.move_to([0, Device.screen.height])
      end
    end
  end

  # Needed for the tableview to create the proper scroll size and cells
  def tableView(tableView, numberOfRowsInSection:section)
    @data.size
  end

  # Cell height is a fixed size, I would like it to be dynamic eventually, but this will do for now
  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    108
  end

  # Table cells get created here
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_identifier = 'challenge_cells'
    cell = tableView.dequeueReusableCellWithIdentifier(cell_identifier)

    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: cell_identifier)

      layout(cell.contentView) do
        subview(UIImageView, :challenge_badge, image: @data[indexPath.row]["badge"].nsurl.nsdata)
        subview(FXLabel, :challenge_title, text: @data[indexPath.row]["title"].upcase)
        subview(FXLabel, :challenge_description, text: @data[indexPath.row]["summary"].downcase)
        subview(UIImageView, :cell_divider)
      end

      bgColorView = layout(UIView, :cell_background)
      cell.setSelectedBackgroundView(bgColorView)
    end

    cell
  end

  def tableView(tableView, willDisplayCell:cell, forRowAtIndexPath:indexPath)
    cell.backgroundColor = UIColor.clearColor
  end

  # Table Row Selection
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    @details.move_to([0, 0])

    @details_title.text = @data[indexPath.row]["title"].upcase
    @details_description.text = @data[indexPath.row]["description"]
    @details_badge.image = UIImage.imageWithData(@data[indexPath.row]["badge"].nsurl.nsdata)

    title_text_size = @details_title.sizeThatFits(CGSizeMake(@details_title.frame.size.width, 900))
    @details_title.height = title_text_size.height

    description_text_size = @details_description.sizeThatFits(CGSizeMake(@details_description.frame.size.width, 900))
    @details_description.height = description_text_size.height
  end

end
