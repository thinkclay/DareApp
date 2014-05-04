class ChallengesListController < UITableViewController

  attr_accessor :challenges_list

  def viewDidLoad
    @challenges_list = []

    client = AFMotion::Client.build_shared("http://localhost:8080/") do
      header "Accept", "application/json"
      response_serializer :json
    end

    AFMotion::Client.shared.get("challenges.json") do |result|
      if result.success?
        @challenges_list = result.object[:challenges]
      else
        p result.error.localizedDescription
      end
    end

    view.dataSource = view.delegate = self
  end

  def viewWillAppear(animated)
    view.reloadData
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @challenges_list.size
  end

  def reloadData
    view.reloadData
  end

  #
  # Table View: Create
  #
  # Globally used CellID, and create places list
  #
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_identifier = 'challenge_cells'
    cell = tableView.dequeueReusableCellWithIdentifier(cell_identifier)

    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: cell_identifier)
      cell.textLabel.text = @challenges_list[indexPath.row]["title"]
    end

    cell
  end

end
