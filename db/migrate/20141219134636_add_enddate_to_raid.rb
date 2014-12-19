class AddEnddateToRaid < ActiveRecord::Migration
  def change
    add_column :raids, :enddate, :datetime
  end
end
