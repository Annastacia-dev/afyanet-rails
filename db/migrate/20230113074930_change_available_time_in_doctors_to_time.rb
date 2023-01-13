class ChangeAvailableTimeInDoctorsToTime < ActiveRecord::Migration[7.0]
  def change
    change_column(:doctors, :specific_days_times_available, :time, using: 'specific_days_times_available::time')
  end
end
