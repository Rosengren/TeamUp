class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.string :name
      t.text :description
      t.text :picture_url
      t.belongs_to :game, index: true
      t.belongs_to :users, index: true

      t.timestamps null: false
    end
  end
end
