class ChallengesListController < UITableViewController

  attr_accessor :challenges_list

  def viewDidLoad
    @challenges_list = []
    Challenges.load(self)
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
  CellID = 'StartLocation'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)
    challenge = @challenges_list[indexPath.row]["title"]
    cell.textLabel.text = challenge
    cell
  end

  #
  # Table View: Row Select
  #
  # This method will be called whenever a table view row is selected
  # We'll grab the row data, and get the corresponding Google Places data to then update both
  # our form input and our post data for the web server
  #
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    self.dismissViewControllerAnimated(true, completion: nil)
  end

end
