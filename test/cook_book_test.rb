require 'Minitest/autorun'
require 'Minitest/pride'
require_relative '../lib/recipe'
require_relative '../lib/ingredient'
require_relative '../lib/cook_book'

class CookBookTest < Minitest::Test
  def setup
    @cookbook = CookBook.new
  end
end
