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

end
