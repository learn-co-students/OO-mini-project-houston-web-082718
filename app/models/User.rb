class User
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def declare_allergen(ingredient)
        Allergen.new(self, ingredient)
    end

    def recipes
        my_cards = RecipeCard.all.select do |card|
            card.user == self
        end
        my_recipes = my_cards.map do |card|
            card.recipe
        end
        my_recipes
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def allergens
        Allergen.all.select do |allergen|
            allergen.user == self
        end
    end

    def top_three_recipes
        my_cards = RecipeCard.all.select do |card|
            card.user == self
        end
        my_cards.max_by(3) { |card| card.rating }
    end

    def most_recent_recipe
        my_cards = RecipeCard.all.select do |card|
            card.user == self
        end
        my_cards.max_by { |card| card.date }
    end
end