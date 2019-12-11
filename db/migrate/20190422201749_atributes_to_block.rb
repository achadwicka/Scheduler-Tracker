class AtributesToBlock < ActiveRecord::Migration[5.1]
  def change
    add_column :blocks, :date, :datetime
    add_column :blocks, :description, :text

  end
end
