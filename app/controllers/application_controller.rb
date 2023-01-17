class ApplicationController < ActionController::API
    include ActionController::Cookies

    # include JwtToken
  
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    before_action :authenticate_patient
    before_action :authenticate_doctor

    def index 
        render json: {message: "AfyaNet API"}
    end

    def encode_token(payload)
        JWT.encode(payload, 'my_s3cr3t', 'HS256')
      end
  
    def authenticate_patient
        header = request.headers["Authorization"]
        token = header.split(' ').last if header
        begin
            @decoded = JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')[0]
            @patient = Patient.find_by(id: @decoded['patient_id'])
        rescue 
            render json: { errors: 'Invalid or absent token'  }, status: :unauthorized
        end
    end

    def authenticate_doctor 
        header = request.headers["Authorization"]
        binding.pry
        token = header.split(' ').last if header
        binding.pry
        begin
            @decoded = JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')[0]
            binding.pry
            @patient = Doctor.find_by(id: @decoded['doctor_id'])
            binding.pry
        rescue 
            render json: { errors: 'Invalid or absent token!'  }, status: :unauthorized
        end
    end
  
    private
  
    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
  
    def render_not_found_response(exception)
        render json: {error: exception.message}, status: :not_found
    end
  
  end
