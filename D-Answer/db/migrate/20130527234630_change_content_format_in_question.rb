class ChangeContentFormatInQuestion < ActiveRecord::Migration
  def self.up
    change_column :question, :content, :text
  end

  def self.down
    change_column :question, :content, :string
  end
end