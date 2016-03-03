class Proficiency < ActiveRecord::Base
  has_many :proficiency_posts
  belongs_to :game
  belongs_to :user
end
