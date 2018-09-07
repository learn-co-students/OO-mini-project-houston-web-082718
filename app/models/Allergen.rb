class Allergen
    attr_reader :ingredient, :user 

    @@all = []
    def initialize(user, ingredient)
        @ingredient = ingredient
        @user = user
        @@all << self
    end
    
    def self.all
        @@all
    end
end