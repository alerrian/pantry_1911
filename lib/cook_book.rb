class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
  end

  def summary
    @recipes.map do |recipe|
      recipe.ingredients_required.inject(summ_hash) do |ingredient|
        require 'pry'; binding.pry
        hash
      end
    end
  end
end
