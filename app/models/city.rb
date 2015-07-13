class City < ActiveRecord::Base
  has_many :workspaces

  validates :title, presence: true
end
