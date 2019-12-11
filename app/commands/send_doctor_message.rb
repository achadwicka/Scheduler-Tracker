class SendDoctorMessage < PowerTypes::Command.new(:reservation)
  ACCOUNT_SID = "AC8599cca45db64acd110a13cfad9318ee"
  AUTH_TOKEN = "9f87e11d0286d9acde7a143d36b76886"
  SENDER_NUMBER = '+56937100313'
  MESES = {'January' => 'Enero', 'February' => 'Febrero', 'March' => 'Marzo',
    'April' => 'Abril', 'May' => 'Mayo', 'June' => 'Junio', 'July' => 'Julio',
    'August' => 'Agosto', 'September' => 'Septiembre', 'October' => 'Octubre',
    'November' => 'Noviembre', 'December' => 'Diciembre'}

  def perform
    twilio_client.api.account.messages.create(
      from: SENDER_NUMBER,
      to: user_number,
      body: memo
      )
  end

  private

  def twilio_client
    @twilio_client ||= Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def memo
    "#{user_name}, ha cambiado tu horario para el #{date_memo}. Tu primer paciente llega a las #{first_block_memo}, y el último a las #{last_block_memo}"
  end

  def user_name
    @reservation.doctor.first_name
  end

  def user_number
    @reservation.doctor.cel_number
  end

  def first_block_memo
    @first_block_memo ||= first_block.date[0, 5]
  end

  def last_block_memo
    @last_block_memo ||= last_block.date[0, 5]
  end

  def first_block
    @first_block ||= day_reservations.first.block
  end

  def last_block
    @last_block ||= day_reservations.last.block
  end

  def day_reservations
    @day_reservations ||= Reservation.for_doctor(@reservation.doctor).on_date(@reservation.date).sorted
  end

  def date_memo
    @date_memo ||= begin
      date = @reservation.date
      stringed_date = date.to_s
      day = stringed_date[-2, 2]
      month = Date::MONTHNAMES[stringed_date[-5, 2].to_i]
      month = MESES[month]
      year = stringed_date[0, 4]
      "#{day} de #{month} de #{year}"
    end
  end
end