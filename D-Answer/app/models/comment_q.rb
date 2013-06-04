class CommentQ < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id", :inverse_of => :commentqs
  
  belongs_to :question, :class_name => "Question", :foreign_key => "question_id", :inverse_of => :commentqs
  
  attr_accessible :commented_on, :content
end