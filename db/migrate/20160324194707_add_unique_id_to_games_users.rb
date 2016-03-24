class AddUniqueIdToGamesUsers < ActiveRecord::Migration
  def change
    add_column :games_users, :id, :primary_key
  end
end
