class DebateSide < ActiveRecord::Base
  belongs_to :debate
  belongs_to :side
end
