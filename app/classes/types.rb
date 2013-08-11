class Types

  def self.load(challenge_types)
    [
      {
        'name'  => 'action',
        'label' => 'Action: athletics, sports, excersize'
      },
      {
        'name'  => 'adventure',
        'label' => 'Adventure: exploring'
      },
      {
        'name'  => 'dare',
        'label' => 'Dare: social experiments, dangerous'
      },
      {
        'name'  => 'drinking',
        'label' => 'Drinking: shots, beer tours, events'
      },
      {
        'name'  => 'food',
        'label' => 'Food: eating, playing, or making'
      },
      {
        'name'  => 'other',
        'label' => 'Other: generic challenge'
      },
      {
        'name'  => 'strategy',
        'label' => 'Strategy: gaming, puzzles'
      },
      {
        'name'  => 'territory',
        'label' => 'Territory: king of the hill, CTF'
      },
      {
        'name'  => 'travel',
        'label' => 'Travel: sites, cities, states, countries'
      }
    ]
  end

end