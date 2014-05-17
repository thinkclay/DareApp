class FindViewController < UIViewController

  include Interface

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

    @table = layout(UITableView, :challenges_table, delegate: self, dataSource: self)
  end

  def viewWillAppear(animated)
    @table.reloadData
  end

  layout :side do
    subview(FXLabel, :h1, text: 'FIND A CHALLENGE')
    subview(@table, :challenges_list)
  end

  # Needed for the tableview to create the proper scroll size and cells
  def tableView(tableView, numberOfRowsInSection:section)
    @data.size
  end

  # Cell height is a fixed size, I would like it to be dynamic eventually, but this will do for now
  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    106
  end

  # Table cells get created here
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier('challenge_cells')

    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: 'challenge_cells')

      layout(cell.contentView) do
        subview(UIImageView, :challenge_badge, image: @data[indexPath.row]["badge"].nsurl.nsdata)
        subview(FXLabel, :challenge_title, text: @data[indexPath.row]["title"].upcase)
        subview(FXLabel, :challenge_description, text: @data[indexPath.row]["summary"].downcase)
        subview(UIImageView, :cell_divider)
      end

      cell.setSelectedBackgroundView(layout(UIView, :cell_background))
    end

    cell
  end

  def tableView(tableView, willDisplayCell:cell, forRowAtIndexPath:indexPath)
    cell.backgroundColor = UIColor.clearColor
  end

  # Table Row Selection
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    @modals = (! @modals.nil? && @modals.size < 10) ? @modals : {}

    @modals[indexPath] ||= create_modal(layout(UIView, :modal_window)) do
      details_badge = subview(UIImageView, :details_badge, image: UIImage.imageWithData(@data[indexPath.row][:badge].nsurl.nsdata))

      details_title = subview(FXLabel, :details_title, text: @data[indexPath.row][:title].upcase)
      title_text_size = details_title.sizeThatFits(CGSizeMake(details_title.frame.size.width, 900))
      details_title.height = title_text_size.height

      details_description = subview(UITextView, :details_description, text: @data[indexPath.row][:description])
      description_text_size = details_description.sizeThatFits(CGSizeMake(details_description.frame.size.width, 900))
      details_description.height = description_text_size.height

      # Embed a scrollable table of rules here
      subview(UIImageView, :rules) do
        @data[indexPath.row][:rules].each do |rule|
          subview(UILabel, :rule, text: rule[:title])
        end
      end
    end

    show_modal(@modals[indexPath])
  end

end
