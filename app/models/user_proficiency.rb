class UserProficiency < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :proficiency_id,
    message: "Proficiency already added to users profile"}
  belongs_to :user
  belongs_to :proficiency
end
