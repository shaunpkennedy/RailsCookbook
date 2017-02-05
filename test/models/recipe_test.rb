require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
 test "creates a valid record" do
  recipe = Recipe.new
  recipe.title = "Ice water"
  recipe.ingredients = ["one glass","water","ice"].join("<br>")
  recipe.instructions = "Combine all ingredients into the glass and let sit for two minutes. Serve immediately."
  assert recipe.save
 end
 
 test "should not save unless title is filled in" do
  recipe = Recipe.new
  assert !recipe.save # save should fail because there are errors.
  assert recipe.errors[:title].include?("can't be blank")
 end
 
 test "should not save unless ingredients is filled in" do
  recipe = Recipe.new
  assert !recipe.save # save should fail because there are errors.
  assert recipe.errors[:ingredients].include?("can't be blank")
 end
 
 test "should not save unless instructions is filled in" do
  recipe = Recipe.new
  assert !recipe.save # save should fail because there are errors.
  assert recipe.errors[:instructions].include?("can't be blank")
 end
 
  test "should only have one recipe with the same name" do
    recipe = Recipe.new(:title =>"Toast")
    recipe.save
    recipe.valid?
    assert recipe.errors[:title].include?("must be unique")
  end
 
  test "association of one recipe and one category" do
    recipe = Recipe.new(:title => "YumYum")
    recipe.category_id = 2
    recipe.save
  
    assert recipe.category_id = 2
    
  end
  
end
