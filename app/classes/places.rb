class Places
  API_KEY = "AIzaSyBKSvfkq8hXzpZ18adVvCa4T2gO9nS5LeA"
  #See google places documentation at https://developers.google.com/places/documentation/ to obtain a key

  def self.load(places_list_controller)
    BW::Location.get do |result|
      BW::Location.stop
      BubbleWrap::HTTP.get("https://maps.googleapis.com/maps/api/place/search/json?location=#{result[:to].latitude},#{result[:to].longitude}&radius=500&sensor=false&key=#{API_KEY}") do |response|
        places_list_controller.places_list = BW::JSON.parse(response.body.to_str)["results"]
        places_list_controller.reloadData
      end
    end
  end
end
