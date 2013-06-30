class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user
      t.datetime :answered_on
      t.references :question
      t.string :content
      t.integer :score

      t.timestamps
    end
    add_index :answers, :user_id
    add_index :answers, :question_id
  end
end
