class Argument < ActiveRecord::Base
  belongs_to :debate
  belongs_to :debate_participant
  belongs_to :side
end
