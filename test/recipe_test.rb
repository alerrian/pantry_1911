require 'Minitest/autorun'
require 'Minitest/pride'
require_relative '../lib/recipe'
require_relative '../lib/ingredient'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new('Cheese', 'C', 100)
    @ingredient2 = Ingredient.new('Macaroni', 'oz', 30)
    @recipe = Recipe.new('Mac and Cheese')
  end

  def test_a_recipe_exists
    assert_instance_of Recipe, @recipe
  end

  def test_a_recipe_has_attributes
    assert_equal 'Mac and Cheese', @recipe.name
  end
end
