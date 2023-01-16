class MedicalRecordsController < ApplicationController

    skip_before_action :patient_authorize
    skip_before_action :doctor_authorize

    def index 
        @medical_records = MedicalRecord.all
        render json: @medical_records, status: :ok
    end

    def show
        @medical_record = MedicalRecord.find(params[:id])
        render json: @medical_record, status: :ok
    end

    def create
        @patient = Patient.find(params[:patient_id])
        @medical_record = @patient.medical_records.create!(medical_record_params)
        render json: @medical_record, status: :created
    end

    def update
        @medical_record = MedicalRecord.find(params[:id])
        @medical_record.update!(medical_record_params)
        render json: @medical_record, status: :ok
    end

    def destroy
        @medical_record = MedicalRecord.find(params[:id])
        @medical_record.destroy
        render json: @medical_record, status: :ok
    end

    private

    def medical_record_params
        params.permit(:blood_pressure, :temperature, :weight, :height, :allergies, :medications, :patient_id)
    end


end
