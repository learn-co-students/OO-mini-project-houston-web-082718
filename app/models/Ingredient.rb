class Ingredient
    
    attr_reader :name
    
    @@all = []
    
    def initialize (name)
        @name = name
        
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        allergies = {}
        Allergen.all.each do |allergy|
            allergies[allergy.ingredient] = allergies[allergy.ingredient] ? allergies[allergy.ingredient] + 1 : 1
        end

        allergies.key(allergies.values.max)
    end

    def is_allergen
        Allergen.all.each do |allergy|
            if allergy.ingredient == self
                return true
            end
        end
        false
    end
end
