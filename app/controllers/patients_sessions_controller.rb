class PatientsSessionsController < ApplicationController

  wrap_parameters format: []
  skip_before_action :patient_authorize, only: :create
  skip_before_action :doctor_authorize

  def create
    patient = Patient.find_by(email: params[:email])

    if patient && patient.authenticate(params[:password])
      if (params[:remember_me])
        cookies.permanent[:auth_token] = patient.auth_token
      else
        cookies[:auth_token] = patient.auth_token
      end
        render json: patient, status: :created
    else
      render json: {errors: ["Invalid email or password"]}, status: :unprocessable_entity
    end 
  end

  def destroy
    cookies.delete(:auth_token)
    render json: {message: "Logged out"}, status: :ok
  end

end