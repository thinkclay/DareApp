class MapViewController < UIViewController

  def init
    self
  end

  def loadView
    self.view = MKMapView.alloc.init
    view.delegate = self
  end

  def viewDidLoad
    region = MKCoordinateRegionMake(CLLocationCoordinate2D.new(50.85, 4.35), MKCoordinateSpanMake(3.1, 3.1))
    self.view.setRegion(region)
  end

  def viewWillAppear(animated)
  end

end