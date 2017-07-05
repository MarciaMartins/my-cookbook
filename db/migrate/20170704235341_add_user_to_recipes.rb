class AddUserToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :user, :string
  end
end
