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
  include AASM

  aasm do
    state :pending, :initial => true
    state :assigned, :confirmed, :declined, :cancelled, :completed


    event :assign do
      transitions :from => :pending, :to => :assigned, :after => :assigned_email
    end

    event :confirm do
      transitions :from => :assigned, :to => :confirmed
    end

    event :decline do
      transitions :from => [:assigned], :to => :pending
    end

    event :cancel do
      transitions :from => [:confirmed, :pending, :assigned], :to => :cancelled
    end

    event :complete do
      transitions :from => :confirmed, :to => :completed
    end
  end

  def assigned_email
    tracker = Mixpanel::Tracker.new(ENV["MIX_PANEL"])
    tracker.track(self.greeter_id, 'booking was assigned', {
      '$email' => User.find(self.greeter_id).email
    })
  end

  def confirmed_email
    tracker = Mixpanel::Tracker.new(ENV["MIX_PANEL"])
    tracker.track(self.visitor_id, 'booking was confirmed', {
      '$email' => User.find(self.visitor_id).email
      '$email' => User.find(self.greeter_id).email
      '$email' => User.find_by(admin: true).email
    })
  end

  def decline_email
    tracker = Mixpanel::Tracker.new(ENV["MIX_PANEL"])
    tracker.track(self.visitor_id, 'booking was declined', {
      '$email' => User.find_by(admin: true).email
    })
  end

  def cancel_email
    tracker = Mixpanel::Tracker.new(ENV["MIX_PANEL"])
    tracker.track(self.visitor_id, 'booking was cancelled', {
      '$email' => User.find_by(admin: true).email
    })
  end





  # def assigned_email
  #   tracker = Mixpanel::Tracker.new(ENV["MIX_PANEL"])
  #   tracker.people.set(id, {
  #     '$email' => email,
  #     'is_greeter' => greeter,
  #     'name' => name
  #   })
  # end



end

# 1.admin assign to a greeter ( status:assigned greeter)
# 2.greeter confirm the request (status:confirmed visitor, admin, greeter.)
# 3.greeter decline the request (status:pending admin)
# 4.visitor decline the request (status:canceled admin)
# 5.tour finished (status: complete visitor)
