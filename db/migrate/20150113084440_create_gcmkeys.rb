class CreateGcmkeys < ActiveRecord::Migration
  def change
    create_table :gcmkeys do |t|
      t.text :gcm_reg_key
      t.integer :user_id

      t.timestamps
    end
  end
end
