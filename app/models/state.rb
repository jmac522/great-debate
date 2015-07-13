class State < ActiveRecord::Base
  has_many :users

  validates :state, presence: true
  validates :abbreviation, presence: true
end
