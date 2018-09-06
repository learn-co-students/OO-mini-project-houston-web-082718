require_relative '../config/environment.rb'


john = User.new("John")
kim = User.new("Kim")
ethan = User.new("Ethan")

salt = Ingredient.new("salt")
pepper = Ingredient.new("pepper")



salt_and_pepper = Recipe.new("recipe_salt and pepper")
pie = Recipe.new("pie")

allergen1 = Allergen.new(john, salt)
allergen2 = Allergen.new(john, pepper)
allergen3 = Allergen.new(kim, pepper)
allergen4 = Allergen.new(ethan, pepper)




recipe_card1 = RecipeCard.new("0906", 3, john, salt_and_pepper)
recipe_card2 = RecipeCard.new("0906", 2, john, pie)
recipe_card3 = RecipeCard.new("0906", 1, john, salt_and_pepper)
# recipe_card4 = RecipeCard.new("0906", 5, john, pie)


recipeingredient = RecipeIngredient.new(salt_and_pepper, pepper)
binding.pry
