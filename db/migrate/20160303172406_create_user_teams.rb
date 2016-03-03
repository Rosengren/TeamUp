class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|
      t.string :role
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true

      t.timestamps null: false
    end
  end
end
