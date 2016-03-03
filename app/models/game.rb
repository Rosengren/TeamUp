class Game < ActiveRecord::Base
  has_many :teams
  has_many :proficiencies
  has_and_belongs_to_many :users
end
