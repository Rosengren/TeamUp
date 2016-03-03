class User < ActiveRecord::Base
  belongs_to :team
  has_many :games
  has_many :proficiencies, through: :user_proficiencies
end
