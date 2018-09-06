class RecipeCard

  attr_accessor :date, :rating, :user, :recipes

  @@all = []

  def initialize(date, rating, user, recipes)
    @date = date
    @rating = rating
    @user = user
    @recipes = recipes
    @@all << self
  end

  def self.all
    @@all
  end

end
