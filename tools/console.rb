require_relative '../config/environment.rb'


nick = User.new("Nick")
chelsea = User.new("Chelsea")

bread = Recipe.new("bread")
cake = Recipe.new("cake")
rice_pudding = Recipe.new("rice pudding")
sandwich = Recipe.new("sandwich")
jello = Recipe.new("jello")


n_bread_card = nick.add_recipe_card(bread, Time.now, 5)
n_sandwich_card = nick.add_recipe_card(sandwich, Time.now + 30, 8)
c_sandwich_card = chelsea.add_recipe_card(sandwich, Time.now + 30, 6)
n_jello_card = nick.add_recipe_card(jello, Time.now, 1)
n_rice_pudding_card = nick.add_recipe_card(rice_pudding, Time.now, 2)

sugar = Ingredient.new("sugar")
flour = Ingredient.new("flour")
salt = Ingredient.new("salt")
wheat = Ingredient.new("wheat")
butter = Ingredient.new("butter")
milk = Ingredient.new("milk")

nick.declare_allergen(sugar)
chelsea.declare_allergen(milk)
chelsea.declare_allergen(flour)
chelsea.declare_allergen(sugar)

cake.add_ingredients([flour, salt, sugar])




binding.pry
true