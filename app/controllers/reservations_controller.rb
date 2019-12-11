class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all
    @doctors = Doctor.order(first_name: :asc)

  end

  # GET /reservations_to_edit
  def index_to_edit
    @reservations = Reservation.all
    @doctors = Doctor.order(first_name: :asc)
  end

  def pick_date
    @doctor = Doctor.find(params[:doctor])
  end

  def pick_date_to_edit
    @doctor = Doctor.find(params[:doctor])
  end

  def go_new
    @doctor = Doctor.find(params[:doctor])
    @date = params[:date]
    redirect_to new_reservation_path(:doctor => @doctor, :date => @date)
  end

  def go_edit
    @doctor = Doctor.find(params[:doctor])
    @date = params[:date]
    redirect_to reservations_admin_edit_path(:doctor => @doctor, :date => @date)
  end

  # GET /reservations/1
  def show
    @reservation = Reservation.find(params[:id])

    # Calcular la fecha mas bonito
    @date = @reservation.date.to_s
    @dia = @date[-2,2]
    @mes = Date::MONTHNAMES[@date[-5, 2].to_i]
    @mes = helpers.get_month_spanish @mes
    @año = @date[0, 4]
    @fecha = "#{@dia} de #{@mes} de #{@año}"

    @doctor = Doctor.find(@reservation.doctor_id)
    @client = Client.find(@reservation.client_id)
    @block = Block.find(@reservation.block_id)

  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    @client = current_client
    @date = params[:date]
    @doctor = Doctor.find(params[:doctor])
    @reservation_bll = Reservation.where("date = ? AND doctor_id = ?", @date.to_date, @doctor.id).pluck(:block_id) + [200]
    @blocks = Block.where("id NOT IN (?)", @reservation_bll)
    @dia = @date[-2,2]
    @mes = Date::MONTHNAMES[@date[-5, 2].to_i]
    @año = @date[0, 4]
    @fecha = "#{@dia} de #{@mes} de #{@año}"
  end


  def admin_edit
    @reservation = Reservation.new
    @client = current_client
    @date = params[:date]
    @doctor = Doctor.find(params[:doctor])
    @blocks = Block.all
    @reservations = Reservation.where("date = ? AND doctor_id = ?", @date.to_date, @doctor.id)
    @dia = @date[-2,2]
    @mes = Date::MONTHNAMES[@date[-5, 2].to_i]
    @año = @date[0, 4]
    @fecha = "#{@dia} de #{@mes} de #{@año}"
  end

  # GET /reservations/1/edit
  def edit
    @doctors = Doctor.all
    @client = current_client
  end

  def send_message reservation
    SendMessage.for(reservation: reservation, message: 0)
    # /
    # @body = "Su reserva ha sido agendada para #{@fecha}"
    # account_sid = "AC8599cca45db64acd110a13cfad9318ee"
    # auth_token = "9f87e11d0286d9acde7a143d36b76886"
    # client = Twilio::REST::Client.new account_sid, auth_token
    # client.api.account.messages.create(
    #   from: '+56937100313',
    #   to: '+56992532462',
    #   body: @body
    #   )
    # /
  end

  # POST /reservations
  def create
    @reservation = Reservation.new
    @reservation.doctor_id = params['reservation']['doctor_id']
    @block = Block.find(params['reservation']['block_id'])
    @date = params['reservation']['date']
    @client = current_client
    @reservation.client_id = @client.id
    @reservation.block_id = @block.id
    @reservation.date = @date
    @doctors = Doctor.all
    if @reservation.save
      # Mandar mensaje
      send_message @reservation
      CheckDoctorSchedule.for(reservation: @reservation)
      redirect_to @reservation
    else
      render :new
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: 'Reservation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
    if current_client
      redirect_to client_path, notice: 'Reservation was successfully destroyed.'
    elsif current_doctor
      redirect_to doctor_path, notice: 'Reservation was successfully destroyed.'
    elsif current_admin
      redirect_to root_path, notice: 'Reservation was successfully destroyed.'
    end

    SendMessage.for(reservation: @reservation, message: 2)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_params
      params.require(:reservation).permit(:client, :doctor, :block)
    end
end
