require 'role_model'

class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :votequestions
  has_many :questions, :through => :votequestions

  has_many :voteanswers
  has_many :answers, :through => :voteanswers

  has_many :questions, :class_name => "Question"
  has_many :answers, :class_name => "Answer"
  has_many :commentqs, :class_name => "CommentQ"
  has_many :commentas, :class_name => "CommentA"
  
  has_attached_file :pic, :styles => { :small => "100x100>" },
                          :url  => "/assets/products/:id/:style/:basename.:extension",
                          :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"


  ROLES = %w[admin user]

  include RoleModel 
  roles :admin, :user
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :login, :name, :lastname, :bio, :rating, :role, :score, :pic
    
  # optionally set the integer attribute to store the roles in,
  # :roles_mask is the default
  roles_attribute :roles_mask
  
  #validates_numericality_of :rating
  VALID_STRING_REGEX = /\A[\w+\-\\!\?\,\.\"\' .]*\z/
  validates :login, presence: true, uniqueness: true, format: { with: VALID_STRING_REGEX }, :length => { :in => 1..15 }
  validates :name, format: { with: VALID_STRING_REGEX }
  validates :lastname, format: { with: VALID_STRING_REGEX }
  validates :password, format: { with: VALID_STRING_REGEX }
end
