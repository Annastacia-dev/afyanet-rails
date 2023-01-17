class DoctorsSessionsController < ApplicationController

  wrap_parameters format: []
  skip_before_action :authenticate_doctor, only: :create
  skip_before_action :authenticate_patient
  
  def create
    @doctor = Doctor.find_by(email: params[:email])

    if @doctor && @doctor.authenticate(params[:password])
        token = encode_token(doctor_id: @doctor.id)
        render json: DoctorSerializer.new(@doctor).as_json.merge(jwt: token), status: :accepted
    else
        render json: { errors: ['Invalid email or password!'] }, status: :unauthorized
    end
  end 

end