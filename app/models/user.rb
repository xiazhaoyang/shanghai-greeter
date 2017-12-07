class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_to_mixpanel

  # acts_as_taggable
  # acts_as_taggable_on :experiences

  has_many :greeting_bookings, class_name: "Booking", foreign_key: :greeter_id
  has_many :visiting_bookings, class_name: "Booking", foreign_key: :visitor_id

  has_many :greeters, through: :visiting_bookings, foreign_key: :user_id 

  has_and_belongs_to_many :experiences, join_table: "users_experiences"
  has_attachments :photos, maximum: 20


  # validates :name, presence: true
  # validates :phone_number, presence: true
  # validates :language, presence: true, inclusion: { in: ["English", "Mandarin", "French", "Spanish", "Italian", "German", "Other"], allow_nil: false}

  # include AASM

  # aasm do
  #   state :pending, :initial => true
  #   state :assigned, :confirmed, :declined, :cancelled, :completed,

  #   event :assign do
  #     transitions :from => :pending, :to => :assigned, callback: :assigned_email
  #   end



  #   def assigned_email
  #     tracker = Mixpanel::Tracker.new(ENV["MIX_PANEL"])
  #     tracker.alias(new_internal_id)

  #   end

  # end

  def name
    email
  end

  def send_to_mixpanel
    tracker = Mixpanel::Tracker.new(ENV["MIX_PANEL"])
    tracker.people.set(id, {
      '$email' => email,
      'is_greeter' => greeter,
      'name' => name
    })
  end
end
