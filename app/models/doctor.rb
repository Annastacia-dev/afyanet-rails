class Doctor < ApplicationRecord
    has_many :messages
    has_many :appointments, through: :patients
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :licence_no presence: true, uniqueness: true
    validates :password, presence: true, length: { in: 6..20 }, format: { with: /(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])/ }
    validates :password_confirmation, presence: true
    validates :speciality, presence: true
    validates :contract_length, presence: true
    validates :phone_number, presence: true, length: { is: 10 }, format: { with: /\A[0-9]+\z/ }
    validates :location, presence: true
    validates :days_available_weekly, presence: true
    validates :specific_days_times_available, presence: true
    validates :engaged, presence: true
end
