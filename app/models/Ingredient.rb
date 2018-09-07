class Ingredient
    attr_accessor :name

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    # This is a custom helper method for allergens
    # in the recipe class. It links an ingredient from the
    # allergen array to an ingredient instance.
    def allergen?
        !!Allergen.all.find do |allergen|
            allergen.ingredient == self
        end
    end
    
    def self.most_common_allergen
        sorted_list = Ingredient.all.sort_by do |ingredient|
            users_allergic = ingredient.num_allergic_users_by_ingredient
        end
        sorted_list.last
    end

    def num_allergic_users_by_ingredient
        allergens_to_this_ingredient = Allergen.all.select do |allergen|
            allergen.ingredient == self
        end
        allergens_to_this_ingredient.map do |allergen|
            allergen.user 
        end.count 
    end
    
    def self.all
        @@all
    end
end
