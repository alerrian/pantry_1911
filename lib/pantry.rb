class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    @stock.map do |ingredient, amount|
      return false if recipe.ingredients_required[ingredient] < amount
      return true if recipe.ingredients_required[ingredient] > amount
    end
  end
end
