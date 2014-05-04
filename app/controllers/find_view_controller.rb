class FindViewController < UIViewController

  stylesheet :find_screen

  def loadView
    super

    @challenges_data = []

    client = AFMotion::Client.build_shared("http://clay-laptop.local:8080/") do
      header "Accept", "application/json"
      response_serializer :json
    end

    AFMotion::Client.shared.get("challenges.json") do |result|
      if result.success?
        @challenges_data = result.object[:challenges]
      else
        p result.error.localizedDescription
      end
    end

    @challenges_table = UITableView.alloc.initWithFrame [[0, 50], [Device.screen.width - 35, Device.screen.height - 50]], style: UITableViewStylePlain
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

  layout :root do
    find_text = subview(UIImageView, :text_find)

    subview(@challenges_table, :challenges_list)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @challenges_data.size
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    90
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_identifier = 'challenge_cells'
    cell = tableView.dequeueReusableCellWithIdentifier(cell_identifier)

    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: cell_identifier)
      badge_image = UIImage.imageWithData(NSData.dataWithContentsOfURL(NSURL.URLWithString(@challenges_data[indexPath.row]["badge"])))
      description = @challenges_data[indexPath.row]["description"]

      attributedString = NSMutableAttributedString.alloc.initWithString(description)
      paragraphStyle = NSMutableParagraphStyle.alloc.init
      paragraphStyle.setLineSpacing(5)
      attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, description.length))

      layout(cell.contentView) do
        subview(UIImageView, :challenge_badge, image: badge_image)
        subview(UILabel, :challenge_title, text: @challenges_data[indexPath.row]["title"])
        subview(UILabel, :challenge_description, text: description)
      end

    end

    cell
  end


  def tableView(tableView, willDisplayCell:cell, forRowAtIndexPath:indexPath)
    cell.backgroundColor = UIColor.clearColor
    cell.restyle!
    cell.apply_constraints
  end

end
