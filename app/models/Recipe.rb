require 'pry'
class Recipe
  attr_accessor :users, :ingredients, :allergens

  @@all = []

  def initialize(allergens = 'none')
    @ingredients = []
    @allergens = allergens
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    # arr = [1, 1, 1, 2, 3]
    #
    # freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    #
    # arr.max_by { |v| freq[v] }

    user_recipes = RecipeCard.all.map { |card| card.recipes }
    freq = user_recipes.inject(Hash.new(0)) { |recipe, count| recipe[count] += 1; recipe}
    user_recipes.max_by { |count| freq[count] }
  end

  def add_ingredients(ingredients)
    @ingredients.concat(ingredients)
  end

end
