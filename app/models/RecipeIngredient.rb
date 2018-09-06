class RecipeIngredient

    @@all = []

    def self.all
        @@all
    end
        attr_accessor :recipe, :ingredient
    def initialize(recipe, ingredient)
        @recipe = recipe
        @ingredient = ingredient

        @@all << self
    end

end