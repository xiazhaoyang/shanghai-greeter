class AddFormToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :country, :string
    add_column :bookings, :address, :text
    add_column :bookings, :mobile, :string
    add_column :bookings, :attendees, :integer
    add_column :bookings, :language, :string
  end
end
