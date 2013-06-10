class CommentQ < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id", :inverse_of => :commentqs
  
  belongs_to :question
  
  attr_accessible :commented_on, :content

  VALID_STRING_REGEX = /\A[\w+\-\ .]*\z/

  validates :content, presence: true, uniqueness: true, format: { with: VALID_STRING_REGEX }
end