class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.integer :community_rating
      t.string :location
      t.text :picture_url
      t.string :slug
      t.belongs_to :game, index: true

      t.timestamps null: false
    end
  end
end
