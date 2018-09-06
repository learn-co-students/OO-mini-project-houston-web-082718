class User
    
    attr_reader :name

    @@all = []
    
    def initialize (name)
        
        @@all << self
    end

    def self.all
        @@all
    end

    def recipes
        all_cards = RecipeCard.all.select do |card|
            card.user == self
        end

        all_cards.map do |card|
           card.recipe 
        end
    end

    def add_recipe_card (recipe, date, rating)
        RecipeCard.new(date, rating, self, recipe)
    end

    def declare_allergen (ingredient)
        Allergen.new(self, ingredient)
    end

    def allergens
        Allergen.all.select do |aller|
            aller.user == self 
        end 
    end

    def top_three_recipes
        sorted = recipes.sort_by do |recipe|
            recipe.rating
        end 

        sorted.reverse[0..2]

    end

    def most_recent_recipe
        recipes.last
    end

    def safe_recipes
        Recipe.all.select do |rec|
            is_safe = true
            rec.ingredients.each do |ing|
                allergens.each do |allergy|
                    if allergy.ingredient == ing
                        is_safe = false
                    end
                end
            end
            is_safe
        end
    end
end