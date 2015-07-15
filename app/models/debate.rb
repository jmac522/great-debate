class Debate < ActiveRecord::Base
  belongs_to :topic
  has_many :debate_sides
  has_many :sides, through: :debate_sides
  has_many :debate_participants
  has_many :users, through: :debate_participants
  has_many :arguments

  def side_1
    sides.first
  end

  def side_2
    sides.second
  end

  def participant?(current_user)
    users.include?(current_user)
  end


  def taken_side
    debate_participants.first.side
  end

  def remaining_side
    if side_1 == taken_side
      side_2
    else
      side_1
    end
  end

  def swap_turn
    if self.turn == side_1.title
      self.turn = side_2.title
      save
    else
      self.turn = side_1.title
      save
    end
  end

  def empty?
    debate_participants.count == 0
  end

  def open?
    debate_participants.count == 1
  end
end
