class RemoveUserIdFromProficiencies < ActiveRecord::Migration
  def change
    remove_column :proficiencies, :user_id, :integer
  end
end
