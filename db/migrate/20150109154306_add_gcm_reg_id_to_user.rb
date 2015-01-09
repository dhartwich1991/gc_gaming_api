class AddGcmRegIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :gcm_reg_id, :text
  end
end
