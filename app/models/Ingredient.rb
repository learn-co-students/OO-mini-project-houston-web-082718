class Ingredient

    @@all = []
    attr_accessor :ingredient
    def initialize(ingredient)
        @ingredient = ingredient
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        allergic_ingredient_array = Allergen.all.collect do |allergen|
            allergen.ingredient
        end

        hash = {}
        @@all.each do |ingredient|
            hash[ingredient] = allergic_ingredient_array.count(ingredient)
        end

        hash.key(hash.values.max)
    end

end
