class Vote < ActiveRecord::Base
  belongs_to :debate_participant
  belongs_to :user
  belongs_to :argument


  validates :debate_participant, presence: true
  validates :user, presence: true
  validates :argument, presence: true
end
