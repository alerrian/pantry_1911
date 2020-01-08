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

  def test_a_recipe_stores_ingredients_required
    expected = {}

    assert_equal expected, @recipe.ingredients_required
  end

  def test_a_recipe_can_add_ingredients
    expected = {
      @ingredient1 => 2,
      @ingredient2 => 8
    }

    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal expected, @recipe.ingredients_required
  end

  def test_recipe_can_check_amount_required
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal 2, @recipe.amount_required(@ingredient1)
    assert_equal 8, @recipe.amount_required(@ingredient2)
  end

  def test_recipe_can_get_ingredients
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal [@ingredient1, @ingredient2], @recipe.ingredients
  end
end
