require 'rails_helper'

RSpec.describe Booking, type: :model do
  it "is valid with valid attributes" do
    booking = Booking.new
    booking.booking_date = "2020-06-30"
    booking.user_id = create(:user, name: "Dono")
    booking.schedule = create(:schedule)

    expect(booking).to be_valid
  end
end
