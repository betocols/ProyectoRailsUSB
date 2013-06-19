class CommentA < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id", :inverse_of => :commentas
  
  belongs_to :answer, :class_name => "Answer", :foreign_key => "answer_id", :inverse_of => :comment_as
  
  attr_accessible :commented_on, :content

  VALID_STRING_REGEX = /\A[\w+\-\\!\?\,\.\"\' .]*\z/

#  validates :content, presence: true, uniqueness: true, format: { with: VALID_STRING_REGEX }
end