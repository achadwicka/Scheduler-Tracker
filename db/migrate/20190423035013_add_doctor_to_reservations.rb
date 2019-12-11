class AddDoctorToReservations < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :doctor, foreign_key: true
  end
end
