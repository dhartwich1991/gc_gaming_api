class CreateRaids < ActiveRecord::Migration
  def change
    create_table :raids do |t|
      t.string :name
      t.text :description
      t.string :raidlead

      t.timestamps
    end
  end
end
