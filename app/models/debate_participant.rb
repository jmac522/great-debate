class DebateParticipant < ActiveRecord::Base
  belongs_to :side
  belongs_to :user
  belongs_to :debate
  has_many :arguments
end
