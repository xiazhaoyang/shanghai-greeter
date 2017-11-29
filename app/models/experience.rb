class Experience < ApplicationRecord
  has_and_belongs_to_many :users, join_table: "users_experiences"

  validates :name, presence:true, uniqueness: true
  validates :description, presence: true
end
