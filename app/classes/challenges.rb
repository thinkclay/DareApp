class Challenges

  def self.load(challenges_list_controller)
    client = AFMotion::Client.build_shared("http://localhost:8080/") do
      header "Accept", "application/json"
      response_serializer :json
    end

    AFMotion::Client.shared.get("challenges.json") do |result|
      if result.success?
        p result.object[:challenges]
        challenges_list_controller.challenges_list = result.object[:challenges]
        challenges_list_controller.reloadData
      else
        p result.error.localizedDescription
      end
    end
  end

end
