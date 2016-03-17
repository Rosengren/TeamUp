class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :proficiency_posts, :profiency_id, :proficiency_id
  end
end
