class RecipeCard
    attr_reader :date, :user, :recipe, :rating, :note

    @@all = []
    def initialize(rating, user, date, recipe)
        @rating = rating
        @user = user
        @recipe = recipe
        @date = date
        @@all << self
    end

    def write_note(note)
        @note = note
    end
    
    def self.all
        @@all
    end
end