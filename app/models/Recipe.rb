class Recipe

    @@all = []

    def self.all
        @@all
    end
        attr_accessor :name
    def initialize(name)
        @name = name
        # @user = user
        @@all << self
    end

    def self.most_popular
        recipe_array = RecipeCard.all.collect do |card|
            card.recipe
        end
        hash = {}
        @@all.each do |recipe|
            hash[recipe] = recipe_array.count(recipe)
        end
        hash.key(hash.values.max)
    end

    def users
        cards = RecipeCard.all.select do |recipecard|
            if recipecard.recipe == self
                recipecard.user
            end
        end
        cards.collect do |card|
            card.user
        end
    end

    def ingredients
        arry = RecipeIngredient.all.select do |ri|
            ri.recipe == self
        end
        arry.collect do |recipe|
            recipe.ingredient
        end
    end

    def allergens
        nuarry = Allergen.all.select do |a|
            ingredients.include?(a.ingredient)
        end

        nuarry.collect do |a|
            a.ingredient
        end
    end

    def add_ingredients(ingredient_array)
        ingredient_array.each do |ingredient|
            RecipeIngredient.new(self, ingredient)
        end
    end
end