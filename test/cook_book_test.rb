require 'Minitest/autorun'
require 'Minitest/pride'
require_relative '../lib/recipe'
require_relative '../lib/ingredient'
require_relative '../lib/cook_book'

class CookBookTest < Minitest::Test
  def setup
    @cookbook = CookBook.new
    @ingredient1 = Ingredient.new('Cheese', 'C', 100)
    @ingredient2 = Ingredient.new('Macaroni', 'oz', 30)
    @recipe1 = Recipe.new('Mac and Cheese')
  end

  def test_a_cookbook_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_a_cook_book_hash_attributes
    assert_equal [], @cookbook.recipes
  end
end
