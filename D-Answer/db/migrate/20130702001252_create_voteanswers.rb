class CreateVoteanswers < ActiveRecord::Migration
  def change
    create_table :voteanswers do |t|
      t.integer :user_id
      t.integer :answer_id
      t.integer :vote

      t.timestamps
    end
  end
end
