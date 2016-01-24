class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  REGION  = 'us-west-2'
  KEY     = 'AKIAJ4SYSTTGXD6EQGNA'
  SECRET  = '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'
  TOPIC   = 'arn:aws:sns:us-west-2:079217667697:requests'

  Aws.config.update(
    {
      region: REGION,
      credentials: Aws::Credentials.new(
        KEY,
        SECRET)
    })

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params.merge(clinic_name: params[:clinic_name]))
    @appointment.insurance = current_user.insurance
    @appointment.patient_name = current_user.name
    @appointment.user_id = current_user.id
    @appointment.phone = current_user.phone
    c = Aws::SNS::Client.new(region: REGION)

    p = c.publish(
      topic_arn: TOPIC,
      message: @appointment.to_json)
    puts "Published... #{p.message_id}"
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:patient_name, :clinic_name, :days, :time_of_day, :description, :insurance, :reoccur)
    end
end
