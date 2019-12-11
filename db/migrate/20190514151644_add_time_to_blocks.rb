class AddTimeToBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :date, :date
    change_column :blocks, :date, :string
  end
end
