class CreateProficiencyPosts < ActiveRecord::Migration
  def change
    create_table :proficiency_posts do |t|
      t.string :title
      t.string :username
      t.datetime :date
      t.text :content
      t.belongs_to :proficiency, index: true

      t.timestamps null: false
    end
  end
end
