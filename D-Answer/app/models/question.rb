class Question < ActiveRecord::Base
  belongs_to :user
  
  has_many :answers, :dependent => :destroy
  
  has_many :comment_qs, :dependent => :destroy
  
  accepts_nested_attributes_for :comment_qs, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  attr_accessible :title, :category, :content, :published_on, :created_at, :score, :tag_list
  
  acts_as_taggable
  

  VALID_STRING_REGEX = /\A[\w+\-\\!\?\,\.\"\' .]*\z/

  validates :title, presence: true, uniqueness: true, format: { with: VALID_STRING_REGEX }
  validates :content, presence: true, format: { with: VALID_STRING_REGEX }
  
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end