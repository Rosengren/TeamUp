class Proficiency < ActiveRecord::Base
  has_many :proficiency_posts
  has_many :user_proficiencies
  belongs_to :game
  belongs_to :user

  #covert all proficiency names to lowercase and substitute spaces for underscores
  def slug
    name.downcase.gsub(" ", "_")
  end

  def to_param
    "#{id}_#{slug}"
  end
end
