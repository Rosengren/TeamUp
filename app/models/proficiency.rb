class Proficiency < ActiveRecord::Base
  has_many :proficiency_posts
  has_many :user_proficiencies
  belongs_to :game
  belongs_to :user
end
