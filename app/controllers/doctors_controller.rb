class DoctorsController < ApplicationController
  wrap_parameters format: []
  skip_before_action :authorize, only: :create

  # Create a doctor
  def create 
    @doctor = Doctor.create!(doctor_params)
    cookies[:auth_token] = @doctor.auth_token
    render json: @doctor, status: :created
  end

  # Show profile of currently logged in doctor
  def show 
    render json: @current_doctor, status: :ok
  end

  private 
  
  def doctor_params 
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :licence_no, :location, :specialty, :contract_length, :days_available_weekly, :specific_days_times_available, :engaged, :remember_me, :profile_picture)
  end

end

