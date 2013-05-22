class PlacesListController < UITableViewController

  attr_accessor :places_list

  def viewDidLoad
    @places_list = []
    Places.load(self)
    view.dataSource = view.delegate = self
  end

  def viewWillAppear(animated)
    view.reloadData
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @places_list.size
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
    placeItem = @places_list[indexPath.row]["name"]
    cell.textLabel.text = placeItem
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
    create_controller = UIApplication.sharedApplication.delegate.instance_variable_get(:@create)
    create_controller.instance_variable_get(:@input_fields)['location'].text = @places_list[indexPath.row]["name"]
    create_controller.instance_variable_get(:@post_data)['start'] = @places_list[indexPath.row]

    self.dismissViewControllerAnimated(true, completion: nil)
  end

end
