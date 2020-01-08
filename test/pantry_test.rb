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
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_pantry_can_restock
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    assert_equal 15, @pantry.stock_check(@ingredient1)
  end

  def test_pantry_can_check_if_enough_ingredients
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal false, @pantry.enough_ingredients_for?(@recipe)
    @pantry.restock(@ingredient2, 7)

    assert_equal false, @pantry.enough_ingredients_for?(@recipe)
    @pantry.restock(@ingredient2, 1)

    assert_equal true, @pantry.enough_ingredients_for?(@recipe)
  end
end
