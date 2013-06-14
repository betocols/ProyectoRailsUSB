class Answer < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key=>"user_id", :inverse_of => :answers
  
  belongs_to :question
  
  has_many :commentas, :class_name => "CommentA", :inverse_of => :answer, :dependent => :destroy
  
  attr_accessible :answered_on, :content, :score
end
