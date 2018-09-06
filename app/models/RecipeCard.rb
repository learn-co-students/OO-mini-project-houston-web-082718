class RecipeCard

    @@all = []

    def self.all
        @@all
    end
    attr_accessor :date, :rating, :user, :recipe
    def initialize(date, rating, user, recipe)
        @date = date
        @rating = rating
        @user = user
        @recipe = recipe

        @@all << self
    end

end