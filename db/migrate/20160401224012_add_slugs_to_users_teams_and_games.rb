class AddSlugsToUsersTeamsAndGames < ActiveRecord::Migration
  def change
    add_column :games, :slug, :string
    add_column :users, :slug, :string
    add_column :teams, :slug, :string
  end
end
