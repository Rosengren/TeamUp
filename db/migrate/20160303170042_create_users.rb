class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.text :description
      t.text :picture_url
      t.integer :permission_level
      t.belongs_to :team, index: true

      t.timestamps null: false
    end
  end
end
