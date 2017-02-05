class AddCaloriesToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :calories, :integer
  end
end
