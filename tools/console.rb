require_relative '../config/environment.rb'
require 'date'

bob = User.new('Bob')
patty = User.new('Patty')

soup = Recipe.new('Soup')
cereal = Recipe.new('Cereal')

water = Ingredient.new('Water')
salt = Ingredient.new('Salt')
veggies = Ingredient.new('Veggies')
milk = Ingredient.new('Milk')
flakes = Ingredient.new('Flakes')
sugar = Ingredient.new('Sugar')
berries = Ingredient.new('Berries')

bob.declare_allergen(milk)
bob.declare_allergen(berries)

bob.add_recipe_card(soup, Date.today.prev_day, 10)
patty.add_recipe_card(cereal, Date.today.prev_day, 8)
patty.add_recipe_card(soup, Date.today.prev_day, 6)
patty.add_recipe_card(soup, Date.today.prev_day, 3)
patty.add_recipe_card(cereal, Date.today, 1)

cereal.add_ingredients([milk, flakes, sugar, berries])




binding.pry
