class Recipe
    attr_reader :name

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def ingredients
        RecipeIngredient.all.select do |recipe_ingredient|
            recipe_ingredient.recipe == self
        end.map do |recipe_ingredient|
            recipe_ingredient.ingredient
        end
    end

    def add_ingredients(ingredient_arr)
        ingredient_arr.each do |ingredient_obj|
            RecipeIngredient.new(self, ingredient_obj)
        end
    end

    def users
        RecipeCard.all.select do |recipe_card|
            recipe_card.recipe == self
        end.map do |recipe_card|
            recipe_card.user
        end
    end
end
# should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe