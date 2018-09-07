class RecipeCard
    attr_reader :date, :user, :recipe, :rating

    @@all = []
    def initialize(rating, user, date, recipe)
        @rating = rating
        @user = user
        @recipe = recipe
        @date = date
        @@all << self
    end
    
    def self.all
        @@all
    end
end