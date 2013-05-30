class Types

  def self.load(challenge_types)
    [
      {
        'name'  => 'action',
        'group' => 'Action: athletics, sports, excersize'
      },
      {
        'name'  => 'adventure',
        'group' => 'Adventure: exploring'
      },
      {
        'name'  => 'dare',
        'group' => 'Dare: social experiments, dangerous'
      },
      {
        'name'  => 'drinking',
        'group' => 'Drinking: shots, beer tours, events'
      },
      {
        'name'  => 'food',
        'group' => 'Food: eating, playing, or making'
      },
      {
        'name'  => 'other',
        'group' => 'Other: generic challenge'
      },
      {
        'name'  => 'strategy',
        'group' => 'Strategy: gaming, puzzles'
      },
      {
        'name'  => 'territory',
        'group' => 'Territory: king of the hill, CTF'
      },
      {
        'name'  => 'travel',
        'group' => 'Travel: sites, cities, states, countries'
      }
    ]
  end

end