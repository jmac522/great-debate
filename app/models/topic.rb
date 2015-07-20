class Topic < ActiveRecord::Base
  has_many :debates
  has_many :sides

  validates :title, { presence: true, uniqueness: true }
end
