class AddAttsToUser < ActiveRecord::Migration
  def change
    add_column :users, :bio, :string
    add_column :users, :rating, :decimal
    add_column :users, :role, :string
  end
end
