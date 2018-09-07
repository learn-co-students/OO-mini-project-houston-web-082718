require 'pry'

class Recipe

    attr_accessor :name, :ingredients
    @@all = []

    def initialize(name, ingredients = [])
        @name = name
        @ingredients = ingredients
        @@all << self
    end

    def self.all
        @@all
    end

    def users
       arr = RecipeCard.all.select do |card|
            card.recipe == self
        end
        arr.map do |card|
            card.user 
        end 
    end

    def add_ingredients(ingredient_array)
        ingredient_array.each do |ingredient|
            self.ingredients << ingredient
        end
    end

    def allergens
        allergen_foods = []
        Allergen.all.select do |allergen|
            allergen_foods << allergen.ingredient
        end
        allergen_foods.uniq!
        
        self.ingredients & allergen_foods
    end

    def self.most_popular
        recipes = []
        RecipeCard.all.select do |card|
           recipes << card.recipe
        end
        
        recipes.max_by do |recipe|
            recipes.count(recipe)
        end
    end

end