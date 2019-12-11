class SendDailyMessages < PowerTypes::Command.new()
  def perform
    next_day_reservations.each do |reservation|
      puts reservation
      SendMessage.for(reservation: reservation, message: 1)
    end
  end

  private

  def current_date
    @current_date ||= Time.now
  end

  def limit_date
    @limit_date ||= Time.now + 1.day
  end

  def next_day_reservations
    Reservation.where('date > :start_date AND date <= :end_date', {
      start_date: current_date,
      end_date: limit_date
    })
  end
end