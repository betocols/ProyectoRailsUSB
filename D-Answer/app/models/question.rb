class Question < ActiveRecord::Base
  belongs_to :user
  
  has_many :answers
  
  has_many :comment_qs
  
  accepts_nested_attributes_for :comment_qs, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  attr_accessible :title, :category, :content, :published_on, :created_at, :score

  VALID_STRING_REGEX = /\A[\w+\-\\!\?\,\.\"\' .]*\z/

  validates :title, presence: true, uniqueness: true, format: { with: VALID_STRING_REGEX }
  validates :content, presence: true, format: { with: VALID_STRING_REGEX }
end