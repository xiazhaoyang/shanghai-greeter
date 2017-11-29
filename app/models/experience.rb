class Experience < ApplicationRecord
  has_and_belongs_to_many :users, join_table: "users_experiences"
  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :expectation_one, presence: true


  has_attachments :photos, maximum: 6
end
