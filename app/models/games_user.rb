class GamesUser < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :game_id,
    message: "Game already added to users profile"}
  belongs_to :user
  belongs_to :game
end
