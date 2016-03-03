class Team < ActiveRecord::Base
  belongs_to :game
  has_many :users, through: :user_teams
end
