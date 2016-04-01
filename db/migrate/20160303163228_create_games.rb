class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.text :picture_url
      t.string :slug

      t.timestamps null: false
    end


  end
end
