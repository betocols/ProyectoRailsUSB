class Answer < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key=>"user_id", :inverse_of => :answers
  
  belongs_to :question
  
  has_many :comment_as, :class_name => "CommentA", :inverse_of => :answer
  
  attr_accessible :answered_on, :content, :score, :fav
end
