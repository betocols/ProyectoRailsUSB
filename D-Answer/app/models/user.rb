require 'role_model'

class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :questions, :class_name => "Question", :inverse_of => :user
  has_many :answers, :class_name => "Answer", :inverse_of => :user
  has_many :commentqs, :class_name => "CommentQ", :inverse_of => :user
  has_many :commentas, :class_name => "CommentA", :inverse_of => :user
  
  include RoleModel 
  roles :admin, :user
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
    
  # optionally set the integer attribute to store the roles in,
  # :roles_mask is the default
  roles_attribute :roles_mask
  
  #validates_numericality_of :rating
end
