class Topic < ActiveRecord::Base
  has_many :debates
  has_many :sides
end
