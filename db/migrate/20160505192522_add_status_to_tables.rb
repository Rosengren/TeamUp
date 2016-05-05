class AddStatusToTables < ActiveRecord::Migration
  def change
    add_column :games_users, :status, :integer, :default => 1
    add_column :user_proficiencies, :status, :integer, :default => 1
    add_column :teams, :status, :integer, :default => 1
    add_column :users, :status, :integer, :default => 1
  end
end
