class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :category
      t.references :user
      t.string :title
      t.datetime :published_on
      t.string :content

      t.timestamps
    end
    add_index :questions, :user_id
  end
end
