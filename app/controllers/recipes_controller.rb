class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :get_categories, :only =>[:new, :edit, :create, :update]
  before_action :authenticate, :except => [:index, :show]
  
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.includes(:category).all
    @title = "Recipes"
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @title = "Show"
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @title = "New"
    #@categories = Category.all.collect{|c| [c.name, c.id] }
  end

  # GET /recipes/1/edit
  def edit
    @title = "Edit"
    #@categories = Category.all.collect{|c| [c.name, c.id] }
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @title = "Create"
	
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
	@title = "Update"
	
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.includes(:category).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :instructions, :category_id, :calories)
    end
    
  def get_categories
   @categories = Category.all.collect{|c| [c.name, c.id] }
  end    
  
  private
    def login(username, password)
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
    end

end
