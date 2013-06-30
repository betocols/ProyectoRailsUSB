class CreateCommentQs < ActiveRecord::Migration
  def change
    create_table :comment_qs do |t|
      t.references :user
      t.datetime :commented_on
      t.string :content
      t.references :question

      t.timestamps
    end
    add_index :comment_qs, :user_id
    add_index :comment_qs, :question_id
  end
end
