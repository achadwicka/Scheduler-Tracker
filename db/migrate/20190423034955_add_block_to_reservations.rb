class AddBlockToReservations < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :block, foreign_key: true
  end
end
