class Recipe
    attr_accessor :title
    @@all = []

    def initialize(title)
        @title = title

        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_popular
        recipe_cards = []
        RecipeCard.all.each do |card|
            recipe_cards << card.recipe.title
        end
            
            #make hash of all recipes in recipecards.all, then count 
        freq_hash = recipe_cards.inject(Hash.new(0)){ |k,v| k[v] += 1; k}
        recipe_cards.max_by{|v| freq_hash[v]}
    end

    def add_ingredients(ingredients)
        ingredients.map do |ingredient|
            RecipeIngredient.new(self, ingredient)
        end
    end

    def ingredients
        rec_in = RecipeIngredient.all.select do |ri|
            ri.recipe == self
        end
        my_ingredients = []
        rec_in.each do |ri|
            my_ingredients << ri.ingredient
        end
        my_ingredients
    end

    def users
        rec_card = RecipeCard.all.select do |rc|
            rc.recipe == self
        end
        
        my_users = []
        rec_card.each do |rc|
            my_users << rc.user
        end
        my_users

        # my_users = rec_card.each do |rc|
        #     rc.user
        # end
        # my_users
    end

    def allergens
        ingredient_names = []
        self.ingredients.each do |ing|
            ingredient_names << ing.name
        end
        
        allergen_names = []
        Allergen.all.each do |allergen|
            allergen_names << allergen.ingredient.name
        end
        ingredient_names & allergen_names
    end
end