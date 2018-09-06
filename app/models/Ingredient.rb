require 'pry'
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
    user_allergen = User.all.map { |user| user.allergens }.flatten!
    freq = user_allergen.inject(Hash.new(0)) { |allergen, count| allergen[count] += 1; allergen}
    user_allergen.max_by { |count| freq[count] }
  end

end
