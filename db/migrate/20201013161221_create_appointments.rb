class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :service, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
