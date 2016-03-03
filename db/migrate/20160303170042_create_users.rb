class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.text :description
      t.text :picture_url
      t.integer :permission_level

      t.timestamps null: false
    end

    create_table :games_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true
    end
  end
end
