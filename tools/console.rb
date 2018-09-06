require_relative '../config/environment.rb'


salt = Ingredient.new('salt')
oranges = Ingredient.new('oranges')
flour = Ingredient.new('flour')
butter = Ingredient.new('butter')

ethan = User.new("Ethan")
chelsea = User.new('Chelsea')
kim = User.new('Kim')

ethan.declare_allergen(butter)
Allergen.new(kim, butter)
Allergen.new(ethan, flour)

hb = Recipe.new('hamburger')
hd = Recipe.new('hot dog')
c = Recipe.new('cake')

ethan.add_recipe_card(hb, '9293', 5)
ethan.add_recipe_card(hd, '9293', 5)
ethan.add_recipe_card(c, '9293', 5)

chelsea.add_recipe_card(hb, '1000',4)
chelsea.add_recipe_card(c, '1000',4)
chelsea.add_recipe_card(hd, '1000',4)

chelsea.add_recipe_card(c, '1000',4)

hb.add_ingredients([salt, oranges, flour])
hd.add_ingredients([salt])
c.add_ingredients([salt, oranges])





puts Ingredient.most_common_allergen




binding.pry
