class Ingredient

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        allergens = []
        Allergen.all.select do |allergen|
           allergens << allergen.ingredient
        end
        
        allergens.max_by do |ingredient|
            allergens.count(ingredient)
        end
    end

end