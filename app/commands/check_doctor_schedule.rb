class CheckDoctorSchedule < PowerTypes::Command.new(:reservation)
  def perform
    SendDoctorMessage.for(reservation: @reservation) if schedule_changed? && within_next_week?
  end

  private

  def day_reservations
    @day_reservations ||= Reservation.for_doctor(@reservation.doctor).on_date(@reservation.date).sorted
  end

  def first_reservation
    day_reservations.first
  end

  def last_reservation
    day_reservations.last
  end

  def schedule_changed?
    @reservation == first_reservation || @reservation == last_reservation
  end

  def within_next_week?
    next_week = Time.now + 7.days
    @reservation.date < next_week
  end
end