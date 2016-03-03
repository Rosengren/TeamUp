class UserProficiency < ActiveRecord::Base
  belongs_to :user
  belongs_to :proficiency
end
