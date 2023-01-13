class AppointmentsController < ApplicationController

    skip_before_action :doctor_authorize
    skip_before_action :patient_authorize


    def index
        @appointments = Appointment.all
        render json: @appointments, status: :ok
    end

    def show
        @appointment = Appointment.find(params[:id])
        render json: @appointment, status: :ok
    end

    def create
        @appointment = Appointment.create!(appointment_params)
        render json: @appointment, status: :created
    end

    def update
        @appointment = Appointment.find(params[:id])
        @appointment.update!(appointment_params)
        render json: @appointment, status: :ok
    end

    def destroy
        @appointment = Appointment.find(params[:id])
        @appointment.destroy
        render json: @appointment, status: :ok
    end

    private

    def appointment_params
        params.permit(:date, :time, :description, :mode, :appointment_done, :patient_id, :doctor_id, :diagnosis, :treatment)
    end


end
