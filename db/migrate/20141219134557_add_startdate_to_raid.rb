class AddStartdateToRaid < ActiveRecord::Migration
  def change
    add_column :raids, :startdate, :datetime
  end
end
