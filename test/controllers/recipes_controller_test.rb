require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
    User.create :username => "admin", :password => "password", :password_confirmation =>  "password"
  end

  test "should get index" do
    get recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_url, headers: {'HTTP_AUTHORIZATION' => login("admin", "password") }
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { ingredients: @recipe.ingredients, instructions: @recipe.instructions, title: "tester" } }, headers: {'HTTP_AUTHORIZATION' => login("admin", "password") }
    end
    
    assert_redirected_to recipe_url(Recipe.last)
  end

  test "should show recipe" do
    get recipe_url(@recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_url(@recipe), headers: {'HTTP_AUTHORIZATION' => login("admin", "password") }
    assert_response :success
  end

  test "should update recipe" do
    patch recipe_url(@recipe), params: { recipe: { ingredients: @recipe.ingredients, instructions: @recipe.instructions, title: @recipe.title } }, headers: {'HTTP_AUTHORIZATION' => login("admin", "password") }
    assert_redirected_to recipe_url(@recipe)
  end

  test "should destroy recipe" do
   assert_difference('Recipe.count', -1) do
    delete recipe_url(@recipe), headers: {'HTTP_AUTHORIZATION' => login("admin", "password") }
   end
   
   assert_redirected_to recipes_url
  end
  
 private
  def login(username, password)
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
  end
  
end
