class User

  attr_reader :name, :recipes
  attr_accessor :allergens

  @@all = []

  def initialize(name, allergens)
    @name = name
    @allergens = [allergens]
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select { |recipe| recipe.user == self }
  end

  def add_recipe_card(recipes, date, rating)
    RecipeCard.new(date, rating, self, recipes)
  end

  def declare_allergen(ingredient)
    @allergens << ingredient
  end

  def top_three_recipes
    user = RecipeCard.all.select { |r| r.user == self }
    rated = user.sort_by { |card| card.rating }.reverse!
    rated[0..2]
  end

  def most_recent_recipe
    user = RecipeCard.all.select { |r| r.user == self }
    time = user.sort_by { |card| card.date }
    time.last
  end
end
