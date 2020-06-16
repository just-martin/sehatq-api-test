class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :operational_time, :doctor_id, :hospital_id
end
