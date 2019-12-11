class TreatmentsController < ApplicationController


  # GET /treatments
  def index
    @doctor = current_doctor
    @treatments_client_ids =  Reservation.where('doctor_id = ?', @doctor).pluck(:client_id)
    @clients = Client.where('id IN (?)', @treatments_client_ids)


  end

  def showclient
    @client = current_client
    @treatmentscomments_ids = Treatment.where('client_id = ?', @client).pluck(:doctor_id)
    @doctorscomments = Doctor.where('id IN (?)', @treatmentscomments_ids)
    @treatmentscomments = Treatment.where('client_id = ?', @client)
  end

  def client
    @client = current_client
    @doctors = Doctor.all
    @treatmentscomments = Treatment.where('client_id = ?', @client)
  end

  def show
    @treatment = Treatment.new
    @client = Client.find(params[:client])
    @doctor = Doctor.find(params[:doctor])
    @treatmentscomments = Treatment.where('client_id = ? and doctor_id = ?', @client, @doctor)

  end

  # GET /treatments/new
  def new
    @treatment = Treatment.new
    @client = Client.find(params[:client])
    @doctor = current_doctor
  end

  # GET /diagnoses/1/edit
  def edit

  end

  # POST /treatments
  def create
    @treatment = Treatment.new
    @client = params['treatment']['client_id']
    @doctor = params['treatment']['doctor_id']
    @treatment.comment = params['treatment']['comment']
    @treatment.doctor_id = @doctor
    @treatment.client_id = @client

    if @treatment.save
      redirect_to treatments_show_path(:client => @client, :doctor => @doctor), notice: 'Treatment comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /treatment/1
  def update
    if @treatment.update(treatment_params)
      redirect_to @treatment, notice: 'Treatment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /treatment/1
  def destroy
    @treatment.destroy
    redirect_to treatment_url, notice: 'Treatment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def treatment_params
      params.require(:treatment).permit(:comment, :client_id, :doctor_id)
    end
end
