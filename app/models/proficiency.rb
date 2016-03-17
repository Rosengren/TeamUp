class Proficiency < ActiveRecord::Base
  has_many :proficiency_posts
  has_many :user_proficiencies
  belongs_to :game
  has_many :users, through: :user_proficiencies
  accepts_nested_attributes_for :proficiency_posts

  validates_presence_of :slug

  def to_param
    slug
  end
end
