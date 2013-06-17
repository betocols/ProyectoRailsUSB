class AddAttsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :fav, :Integer
  end
end
