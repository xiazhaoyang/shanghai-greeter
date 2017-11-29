class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # acts_as_taggable
  # acts_as_taggable_on :experiences

  has_many :greeting_bookings, class_name: "Booking", foreign_key: :greeter_id
  has_many :visiting_bookings, class_name: "Booking", foreign_key: :visitor_id

  has_many :greeters, through: :visiting_bookings, foreign_key: :user_id 

  has_and_belongs_to_many :experiences, join_table: "users_experiences"



  # validates :name, presence: true
  # validates :phone_number, presence: true
  # validates :language, presence: true, inclusion: { in: ["English", "Mandarin", "French", "Spanish", "Italian", "German", "Other"], allow_nil: false}

end
