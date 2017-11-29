class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :greeter_id
      t.integer :visitor_id
      t.date :date
      t.string :review_title
      t.text :review_content
      t.integer :review_rating

      t.timestamps
    end
  end
end
