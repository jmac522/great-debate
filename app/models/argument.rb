class Argument < ActiveRecord::Base
  belongs_to :debate
  belongs_to :debate_participant
  belongs_to :side
  has_many :votes

  def user
    debate_participant.user
  end

  def self.top
    all.order("score DESC").first
  end
end
