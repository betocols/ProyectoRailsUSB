require 'role_model'

class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :questions, :class_name => "Question"
  has_many :answers, :class_name => "Answer"
  has_many :commentqs, :class_name => "CommentQ"
  has_many :commentas, :class_name => "CommentA"
  
  ROLES = %w[admin user]

  include RoleModel 
  roles :admin, :user
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :login, :name, :lastname, :bio, :rating, :role, :score
    
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
