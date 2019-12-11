class AddClientToReservations < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :client, foreign_key: true
  end
end
