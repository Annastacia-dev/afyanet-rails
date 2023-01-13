class ChangeTimeInAppointmentToTimeWithZone < ActiveRecord::Migration[7.0]
  def change
    change_column(:appointments, :time, :time, using: 'time::time')
  end
end
