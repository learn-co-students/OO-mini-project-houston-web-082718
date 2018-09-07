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
    # ties recipe to ingredient via recipeingredient and 
    # returns an array of ingredient instances
    def ingredients
        RecipeIngredient.all.select do |recipe_ingredient|
            recipe_ingredient.recipe == self
        end.map do |recipe_ingredient|
            recipe_ingredient.ingredient
        end
    end
    # important to remember the argument is asking for an actual
    # array. This will take the array of objects and add them all 
    # to the recipeingredient as instances for self recipe
    def add_ingredients(ingredient_arr)
        ingredient_arr.each do |ingredient_obj|
            RecipeIngredient.new(self, ingredient_obj)
        end
    end
    # this class method takes the class all array and sorts
    # it by recipes with the most users by using #users below
    # as a helper method and counting the instances in it to
    # return the last instance.
    def self.most_popular
        self.all.sort_by do |recipe|
            recipe.users.count
        end.last
    end
    # This uses a customer helper method #allergen?
    # This looks at all ingredients in a recipe to see if
    # any of them are allergens via helper method
    def allergens
        self.ingredients.select do |ingredient_instance|
            ingredient_instance.allergen?
        end
    end
    # Remember this is the opposite of #recipe for user class
    # it uses the recipecard link to return all users for a 
    # specific recipe instance
    def users
        RecipeCard.all.select do |recipe_card|
            recipe_card.recipe == self
        end.map do |recipe_card|
            recipe_card.user
        end
    end
end
# should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe