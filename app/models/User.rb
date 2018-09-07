require 'pry'

class User

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
    end

    def self.all
        @@all
    end

    def add_recipe_card(recipe, rating)
        RecipeCard.new(self, recipe, rating)
    end

    def recipes
        arr = RecipeCard.all.select do |card|
            card.user == self
        end
        arr.map do |card|
            card.recipe
        end
    end

    def recipe_cards
        RecipeCard.all.select do |card|
            card.user == self
        end
    end

    def declare_allergen(ingredient)
        Allergen.new(self, ingredient)
    end

    def allergens
        Allergen.all.select do |allergen|
            allergen.user == self
        end
    end

    def top_three_recipes
        arr = RecipeCard.all.sort_by do |card|
            card.rating
        end
        arr = arr.reverse
        arr = [arr[0].recipe, arr[1].recipe, arr[2].recipe]
        arr
    end

    def most_recent_recipe
        arr = self.recipe_cards.sort_by do |card|
            card.date
        end
        arr[-1]
    end

end