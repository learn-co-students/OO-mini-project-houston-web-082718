class Allergen

  def self.all
    User.all.map { |u| u.allergens }
  end
end
