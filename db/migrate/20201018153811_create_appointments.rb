class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :date_of_appointment
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.datetime :time

      t.timestamps
    end
  end
end
