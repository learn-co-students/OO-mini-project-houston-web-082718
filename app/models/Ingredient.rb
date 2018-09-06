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
        allergen_names = []
        Allergen.all.each do |allergen|
            allergen_names << allergen.ingredient
        end
            #make hash of all recipes in recipecards.all, then count 
        freq_hash = allergen_names.inject(Hash.new(0)){ |k,v| k[v] += 1; k}
        allergen_names.max_by{|v| freq_hash[v]}
    end
end
