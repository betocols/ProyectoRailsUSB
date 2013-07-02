class Voteanswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  attr_accessible :answer_id, :user_id, :vote
end
