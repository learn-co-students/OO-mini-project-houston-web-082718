class Recipe

    attr_reader :name
    
    @@all = []

    def initialize (name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_popular
        user_counts = {}
        Recipe.all.each do |rec|
            user_counts[rec] = rec.users.length
        end

        user_counts.key(user_counts.values.max)
    end

    def users
        all_cards = RecipeCard.all.select do |card|
            card.recipe == self
        end

        all_cards.map do |card|
            card.user
        end
    end

    def ingredients
        found_ingredients = RecipeIngredient.all.select do |ri|
            ri.recipe == self
        end
        
        found_ingredients.map do |found|
            found.ingredient
        end
    end

    def allergens
        ingredients.select do |ingredient|
            ingredient.is_allergen
        end
    end

    def add_ingredients (ingredients)
        ingredients.each do |ingredient|
            RecipeIngredient.new(self, ingredient)
        end
    end
end