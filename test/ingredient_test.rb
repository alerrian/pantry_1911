require_relative '../lib/ingredient'

class IngredientTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new('Cheese', 'oz', 50)
  end

  def test_an_ingredient_exists
    assert_instance_of Ingredient, @ingredient1
  end

  def test_ingredient_has_attributes
    assert_equal 'Cheese', @ingredient1.name
    assert_equal 'oz', @ingredient1.unit
    assert_equal 50, @ingredient1.calories
  end
end
