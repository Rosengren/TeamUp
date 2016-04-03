class Game < ActiveRecord::Base
  has_many :teams
  has_many :proficiencies
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :proficiencies
  validates :name, presence: true, uniqueness: true
  validates_presence_of :slug

  def to_param
    slug
  end
end
