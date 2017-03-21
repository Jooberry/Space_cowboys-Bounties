require('pry')
require_relative('models/bounty')

Bounty.delete_all()

bounty1 = Bounty.new({
  'name' => 'Joo',
  'danger_level' => 'ermagerd',
  'homeworld' => 'Orient World',
  'favourite_weapon' => 'insults'
  })
bounty2 = Bounty.new({
  'name' => 'Allegra',
  'danger_level' => 'annoying',
  'homeworld' => 'Teviot Place',
  'favourite_weapon' => 'catchy songs'
  })

bounty1.save()
bounty2.save()



binding.pry
nil