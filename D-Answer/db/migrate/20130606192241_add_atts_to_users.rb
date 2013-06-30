class AddAttsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :score, :int
  end
end
