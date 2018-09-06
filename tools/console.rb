require_relative '../config/environment.rb'

user_one = User.new('Trung', 'lactose')
user_two = User.new('Violet', 'gluten')
user_three = User.new('Joe', 'gluten')

ing1 = Ingredient.new('flour')
ing2 = Ingredient.new('salt')
ing3 = Ingredient.new('sugar')

recipe_one = Recipe.new(user_one)
recipe_two = Recipe.new(user_two)
recipe_three = Recipe.new(user_two)

ri = RecipeIngredient.new(ing1, recipe_two)

recipe_one.add_ingredients(['sugar', 'chocolate', 'mustard'])
recipe_two.add_ingredients(['bread', 'flour', 'salsa'])

recipe_card_one = RecipeCard.new(Time.now, 5, user_one, recipe_one)
recipe_card_two = RecipeCard.new(Time.now, 3, user_one, recipe_two)
recipe_card_three = RecipeCard.new(Time.now, 1, user_one, recipe_two)
recipe_card_four = RecipeCard.new(Time.now, 4, user_one, recipe_one)
recipe_card_five = RecipeCard.new(Time.now, 1, user_one, recipe_two)

binding.pry
