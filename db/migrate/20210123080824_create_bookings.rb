class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :equipment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
