class Argument < ActiveRecord::Base
  belongs_to :debate
  belongs_to :debate_participant
  belongs_to :side
  has_many :votes
end
