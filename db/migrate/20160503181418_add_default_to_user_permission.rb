class AddDefaultToUserPermission < ActiveRecord::Migration
  def change
    change_column :users, :permission_level, :integer, :default => 1
  end
end
