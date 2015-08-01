class Vote < ActiveRecord::Base
  belongs_to :debate_participant
  belongs_to :user
  belongs_to :argument


  validates :debate_participant, presence: true
  validates :user, presence: true
  validates :argument, presence: true

  def score
    self.debate_participant.score += self.value
    self.debate_participant.side.points += self.value
    self.debate_participant.user.xp += self.value * 10
    self.debate_participant.user.rank_up
    self.user.xp += 1
    self.user.rank_up
    self.argument.score += self.value
    self.argument.save
    self.user.save
    self.debate_participant.save
    self.debate_participant.user.save
    self.debate_participant.side.save
  end
end
