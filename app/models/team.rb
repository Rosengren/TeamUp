class Team < ActiveRecord::Base
  belongs_to :game
  has_many :user_teams
  has_many :users, through: :user_teams

  validates_presence_of :slug
  def to_param
    slug
  end
end
