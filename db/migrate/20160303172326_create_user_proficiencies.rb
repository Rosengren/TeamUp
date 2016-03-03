class CreateUserProficiencies < ActiveRecord::Migration
  def change
    create_table :user_proficiencies do |t|
      t.text :endorsements
      t.belongs_to :user, index: true
      t.belongs_to :proficiency, index: true

      t.timestamps null: false
    end
  end
end
