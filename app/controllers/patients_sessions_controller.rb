class PatientsSessionsController < ApplicationController

  wrap_parameters format: []
  skip_before_action :authenticate_patient, only: :create
  skip_before_action :authenticate_doctor


  # Login patient
  def create
    @patient = Patient.find_by(email: params[:email])
    if @patient && @patient.authenticate(params[:password])
      token = encode_token(patient_id: @patient.id)
      render json: PatientSerializer.new(@patient).as_json.merge(jwt: token), status: :accepted
    else
      render json: { errors: ['Invalid email or password!'] }, status: :unauthorized
    end
  end

  # def destroy
  #   token = request.headers['Authorization'].split(' ').last
  #   if token.present?
  #     session.delete(:patient_id)
  #     render json: { message: 'Logout successful' }, status: :ok
  #   else
  #     render json: { error: 'Missing token' }, status: :unauthorized
  #   end
  # end
  

end
