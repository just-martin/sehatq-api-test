class BookingSerializer < ActiveModel::Serializer
  attributes :id, :queue, :user_id, :schedule_id
end
