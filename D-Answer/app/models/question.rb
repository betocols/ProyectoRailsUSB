class Question < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  
  has_many :answers
  
  has_many :comment_qs
  
  accepts_nested_attributes_for :comment_qs, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  attr_accessible :title, :category, :content, :published_on, :created_at
end