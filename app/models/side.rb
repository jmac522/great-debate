class Side < ActiveRecord::Base
  belongs_to :topic
  has_many :debate_sides
  has_many :debates, through: :debate_sides
  has_many :debate_participants #change to has many
  has_many :arguments
end
