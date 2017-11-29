class Booking < ApplicationRecord
  belongs_to :experience
  belongs_to :greeter, class_name: "User", foreign_key: :greeter_id
  belongs_to :visitor, class_name: "User", foreign_key: :visitor_id

  validates :date, presence: true
end
