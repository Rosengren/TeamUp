class AddFacetsToUser < ActiveRecord::Migration
  def change
    add_column :users, :reset_token, :string
    add_column :users, :reset_token_expiry, :datetime
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmation_expiry, :datetime
    add_column :users, :last_ip_address, :string
  end
end
