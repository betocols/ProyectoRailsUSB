class CreateVotequestions < ActiveRecord::Migration
  def change
    create_table :votequestions do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :vote

      t.timestamps
    end
  end
end
