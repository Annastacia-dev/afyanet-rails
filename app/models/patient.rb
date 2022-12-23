class Patient < ApplicationRecord
    has_secure_password
    has_many :messages
    has_many :appointments
    has_many :medical_records


    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please enter a valid email address" }
    validates :password, presence: true, length: { in: 6..20 }, format: { with: /(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])/ }
    validates :password_confirmation, presence: true
    validates :phone_number, presence: true, length: { is: 10 }, format: { with: /\A[0-9]+\z/ }
    validates :location, presence: true
    

end
