class Reservation < ApplicationRecord
  belongs_to :block
  belongs_to :doctor
  belongs_to :client

  scope :for_doctor, ->(doctor) { where('doctor_id = ?', doctor.id) }
  scope :on_date, ->(date) { where('date = ?', date) }
  scope :sorted, -> { order(block_id: :asc) }
end
