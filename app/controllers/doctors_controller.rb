class DoctorsController < ApplicationController
  wrap_parameters format: []
  
  skip_before_action :authenticate_doctor, only: [:create, :index]
  skip_before_action :authenticate_patient
  
  def index 
    @doctors = Doctor.all
    render json: @doctors, status: :ok
  end
  
  # Create a doctor on signup
  def create
    @doctor = Doctor.create!(doctor_params)
    
    @doctor && @doctor.authenticate(params[:password])
    token = encode_token(doctor_id: @doctor.id)
    render json: DoctorSerializer.new(@doctor).as_json.merge(jwt: token), status: :created
  end

  # Show profile of currently logged in doctor
  def show 
    render json: @doctor, status: :ok
  end

  # Update logged in/current doctor's attributes
  def update 
    @doctor.update!(doctor_params)
    render json: @doctor, status: :ok
  end

  # Delete a logged in/current doctor's profile altogether
  def destory 
    @doctor.destroy
    render json: { message: "Doctor profile deleted!" }, status: :ok
  end

  private 
  
  def doctor_params 
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :licence_no, :location, :specialty, :contract_length, :days_available_weekly, :specific_days_times_available, :engaged, :remember_me, :profile_picture, :specialty_id)
  end

end