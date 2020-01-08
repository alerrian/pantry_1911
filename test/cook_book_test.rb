# frozen_string_literal: true

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
    @recipe2 = Recipe.new('Burger')
  end

  def test_a_cookbook_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_a_cook_book_hash_attributes
    assert_equal [], @cookbook.recipes
  end

  def test_a_cook_book_can_add_recipes
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @cookbook.add_recipe(@recipe1)

    assert_equal [@recipe1], @cookbook.recipes
  end

  def test_cook_book_can_create_summary
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @cookbook.add_recipe(@recipe1)
    
    expected = {
      name: 'Mac and Cheese',
      details: {
        ingredients: [{
          ingredient: 'Macaroni',
          amount: '8 oz'
        },
        {
          ingredient: 'Cheese',
          amount: '2 C'
        }],
        total_calories: 440
      }
    }

    assert_equal [expected], @cookbook.summary
  end
end
