class ChangeTimeInAppointmentToTime < ActiveRecord::Migration[7.0]
  def change
    change_column(:appointments, :time, :time, using: 'time::time without time zone')
  end
end
