class UserTeam < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :team_id,
    message: "User already added to team."}
  belongs_to :user
  belongs_to :team
end
