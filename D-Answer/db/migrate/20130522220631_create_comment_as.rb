class CreateCommentAs < ActiveRecord::Migration
  def change
    create_table :comment_as do |t|
      t.references :user
      t.datetime :commented_on
      t.string :content
      t.references :answer

      t.timestamps
    end
    add_index :comment_as, :user_id
    add_index :comment_as, :answer_id
  end
end
