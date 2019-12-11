class SendMessage < PowerTypes::Command.new(:reservation, :message)
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
    if @message === 0
      "#{user_name}, has reservado una hora el #{date_memo} a las #{block_memo}"
    elsif @message === 1
      "#{user_name}, recuerda que tienes una hora el #{date_memo} a las #{block_memo}"
    elsif @message === 2
      "#{user_name}, te informamos que tu hora el #{date_memo} a las #{block_memo} ha sido cancelada"
    end
  end

  def user_name
    @reservation.client.first_name
  end

  def user_number
    @reservation.client.cel_number
  end

  def block_memo
    @block_memo ||= @reservation.block.date[0, 5]
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
