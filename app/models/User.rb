class User
    attr_accessor :name

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def recipes 
        RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end.map do |recipe_card|
            recipe_card.recipe 
        end
    end

    # objects_array.sort_by{ |obj| obj.attribute }.reverse
    def top_three_recipes
        RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end.sort_by do |recipe_card| 
            recipe_card.rating
        end.reverse[0...3].map do |recipe_card|
            recipe_card.recipe
        end
    end

    def most_recent_recipe
        RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end.sort_by do |recipe_card|
            recipe_card.date.to_s
        end.reverse.first.recipe
    end

    def add_recipe_card(recipe_instance, date, rating)
        RecipeCard.new(rating, self, date, recipe_instance)
    end

    def declare_allergen(ingredient_instance)
        Allergen.new(self, ingredient_instance)
    end

    def allergens
        Allergen.all.select do |allergen|
            allergen.user == self 
        end.map do |allergen|
            allergen.ingredient
        end
    end
    
    def self.all
        @@all
    end
end