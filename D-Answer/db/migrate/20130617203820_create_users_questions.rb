class CreateUsersQuestions < ActiveRecord::Migration

  def up
    create_table :users_questions do |t|
      t.references :user
      t.integer :questions_id
    end
  end
 
  def down
    drop_table :users_questions
  end

end
