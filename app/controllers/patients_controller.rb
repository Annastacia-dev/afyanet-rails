class PatientsController < ApplicationController
  wrap_parameters format: []
  skip_before_action :patient_authorize , only: [:create, :show]
  skip_before_action :doctor_authorize

  # Create a User on signup 
  def create 
    @patient = Patient.create!(patient_params)
    cookies[:auth_token] = @patient.auth_token
    render json: @patient, status: :created
  end

  # Show an appropriate profile only to the currently logged in patient
  def show 
    render json: @current_patient, status: :ok
  end

  # Update logged in/current patient's attributes
  def update 
    @current_patient.update!(patient_params)
    render json: @current_patient, status: :ok
  end

  # Delete a logged in/current patient's profile altogether
  def destory 
    @current_patient.destroy
    render json: { message: "User deleted" }, status: :ok
  end

  private 
  
  # Strong params method to allow specific attributes to be set via mass assignment, 
  # ... thus prevent potential unauthorized/malicious attribute value setting 
  def patient_params 
    params.permit(:first_name, :last_name, :date_of_birth, :email, :password, :password_confirmation, :phone_number, :location, :remember_me, :profile_picture)
  end

end
