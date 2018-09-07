require_relative '../config/environment.rb'

richard = User.new(name: "Richard")
graham = User.new(name: "Graham")

salt = Ingredient.new("salt")
pepper = Ingredient.new("pepper")
tomato = Ingredient.new("tomato")
curry = Ingredient.new("curry")
meatballs = Ingredient.new("meatballs")

stew = Recipe.new("stew", [salt, pepper, tomato, curry])
pasta = Recipe.new("pasta", [salt, pepper, tomato, meatballs])
salty_balls = Recipe.new("salty balls", [salt, meatballs])
hot_curry = Recipe.new("hot curry", [pepper, curry])

RecipeCard.new(richard, stew, 4)
RecipeCard.new(richard, pasta, 5)
RecipeCard.new(richard, salty_balls, 1)
RecipeCard.new(richard, hot_curry, 5)
RecipeCard.new(graham, stew, 2)

richard.declare_allergen(salt)
graham.declare_allergen(pepper)
graham.declare_allergen(salt)

binding.pry
