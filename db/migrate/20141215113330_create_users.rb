class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.boolean :admin
      t.boolean :moderator

      t.timestamps
    end
  end
end
