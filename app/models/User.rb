class User

    @@all = []

    attr_accessor :name

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        @@all << self
    end

    def recipes
        recipe_array = []
        RecipeCard.all.each do |recipecard|
           if recipecard.user == self
                recipe_array << recipecard.recipe
           end

        end
        recipe_array
    end

    def add_recipe_card(date, rating, recipe)
        RecipeCard.new(date, rating, self, recipe)
    end

    def declare_allergen(ingredient)
        Allergen.new(self, ingredient)
    end

    def allergens
        Allergen.all.collect do |a|
            if a.user == self
                a.ingredient
            end
        end
    end

    def most_recent_recipe
        arry = RecipeCard.all.collect do |atr|
            atr.recipe
        end
        arry.last
    end

    def top_three_recipes
        sorted_array = RecipeCard.all.sort_by do |card|
            card.rating
        end
        
        sorted_array.reverse[0..2].collect do |recipecard|
            recipecard.recipe
        end

    end



end