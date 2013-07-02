class Votequestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  attr_accessible :question_id, :user_id, :vote
end
