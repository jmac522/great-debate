class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :state
  belongs_to :city
  has_many :debate_participants
  has_many :sides, through: :debate_participants
  has_many :arguments

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def voted?(argument)
    argument.votes.each do |vote|
      if vote.user == self
        return true
      end
    end
    false
  end

  def self.top
    all.order("xp DESC").limit(10)
  end

  def rank_up
    if self.xp >= 1000
      self.update(rank: "Debate Champion")
    elsif self.xp >= 500
      self.update(rank: "Debate Master")
    elsif self.xp >= 100
      self.update(rank: "Debate Expert")
    elsif self.xp >= 50
      self.update(rank: "Debate Amateur")
    elsif self.xp >= 25
      self.update(rank: "Debate Novice")
    end
  end

end
