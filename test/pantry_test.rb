require 'Minitest/autorun'
require 'Minitest/pride'
require_relative '../lib/pantry'
require_relative '../lib/recipe'
require_relative '../lib/ingredient'

class RecipeTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new('Cheese', 'C', 100)
    @ingredient2 = Ingredient.new('Macaroni', 'oz', 30)
    @recipe = Recipe.new('Mac and Cheese')
  end

  def test_a_pantry_exists
    assert_instance_of Pantry, @pantry
  end

  def test_a_pantry_hash_attributes
    expected = {}

    assert_equal expected, @pantry.stock
  end

  def test_pantry_can_check_stock
    assert_equal 0, @pantry.check_stock(@ingredient1)
  end
end
