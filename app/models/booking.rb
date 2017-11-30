class Booking < ApplicationRecord
  belongs_to :experience
  belongs_to :greeter, class_name: "User", foreign_key: :greeter_id, required: false
  belongs_to :visitor, class_name: "User", foreign_key: :visitor_id

  validates :date, presence: true

  # def check_date_availability
  #   experience_bookings = self.experience.bookings
  #   bookings = item_bookings.select{|b| b.date == self.start_date && b.end_date >= self.start_date }
  #   bookings += item_bookings.select{|b| b.start_date <= self.end_date && b.end_date >= self.end_date }
  #   return bookings.empty?
  # end

  # def valid_dates
  #   today = Date.today
  #   if date >= today + 5
  #     true
  #   else
  #     false
  #   end
  # end
end
