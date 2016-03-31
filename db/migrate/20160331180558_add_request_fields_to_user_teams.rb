class AddRequestFieldsToUserTeams < ActiveRecord::Migration
  def change
    add_column :user_teams, :status, :integer
    add_column :user_teams, :requestMessage, :string
  end
end
