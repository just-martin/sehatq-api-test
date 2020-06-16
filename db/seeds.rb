# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_or_create_by(email: "admin@kiranatama.com") do |user|
  user.name = "Admin"
  user.password = 'abc12345'
  user.password_confirmation = 'abc12345'
end
puts user.inspect

user = User.find_or_create_by(email: "martin@kiranatama.com") do |user|
  user.name = "Martin"
  user.password = '12345678'
  user.password_confirmation = '12345678'
end
puts user.inspect

user = User.find_or_create_by(email: "martin1@kiranatama.com") do |user|
  user.name = "Martin1"
  user.password = '12345678'
  user.password_confirmation = '12345678'
end
puts user.inspect

user = User.find_or_create_by(email: "martin2@kiranatama.com") do |user|
  user.name = "Martin2"
  user.password = '12345678'
  user.password_confirmation = '12345678'
end
puts user.inspect

user = User.find_or_create_by(email: "martin3@kiranatama.com") do |user|
  user.name = "Martin3"
  user.password = '12345678'
  user.password_confirmation = '12345678'
end
puts user.inspect

user = User.find_or_create_by(email: "martin4@kiranatama.com") do |user|
  user.name = "Martin4"
  user.password = '12345678'
  user.password_confirmation = '12345678'
end
puts user.inspect



budy = Doctor.find_or_create_by(name: "Dr Budy")
puts budy.inspect
andy = Doctor.find_or_create_by(name: "Dr Andy")
puts andy.inspect
annie = Doctor.find_or_create_by(name: "Dr Annie")
puts annie.inspect
sarah = Doctor.find_or_create_by(name: "Dr Sarah")
puts sarah.inspect
jodie = Doctor.find_or_create_by(name: "Dr Jodie")
puts jodie.inspect


siloam = Hospital.find_or_create_by(name: "Siloam")
puts siloam.inspect
sentosa = Hospital.find_or_create_by(name: "Sentosa")
puts sentosa.inspect
mayapada = Hospital.find_or_create_by(name: "Mayapada")
puts mayapada.inspect
hermina = Hospital.find_or_create_by(name: "Hermina")
puts hermina.inspect
harapan_kita = Hospital.find_or_create_by(name: "Harapan Kita")
puts harapan_kita.inspect


# schedule andy
schedule_a1 = Schedule.find_or_create_by( operational_time: "16:00".to_time, day: "Monday", 
                                          doctor_id: budy.id, hospital_id: siloam.id )
schedule_a2 = Schedule.find_or_create_by( operational_time: "16:00".to_time, day: "Tuesday", 
                                          doctor_id: budy.id, hospital_id: siloam.id )
schedule_a3 = Schedule.find_or_create_by( operational_time: "10:00".to_time, day: "Tuesday", 
                                          doctor_id: budy.id, hospital_id: sentosa.id )
schedule_a4 = Schedule.find_or_create_by( operational_time: "10:00".to_time, day: "Wednesday", 
                                          doctor_id: budy.id, hospital_id: sentosa.id )
schedule_a5 = Schedule.find_or_create_by( operational_time: "10:00".to_time, day: "Friday", 
                                          doctor_id: budy.id, hospital_id: sentosa.id )

# schedule budy
schedule_b1 = Schedule.find_or_create_by( operational_time: "18:00".to_time, day: "Monday", 
                                          doctor_id: andy.id, hospital_id: mayapada.id )
schedule_b2 = Schedule.find_or_create_by( operational_time: "18:00".to_time, day: "Tuesday", 
                                          doctor_id: andy.id, hospital_id: mayapada.id )
schedule_b3 = Schedule.find_or_create_by( operational_time: "18:00".to_time, day: "Wednesday", 
                                          doctor_id: andy.id, hospital_id: mayapada.id )
schedule_b4 = Schedule.find_or_create_by( operational_time: "10:00".to_time, day: "Thursday", 
                                          doctor_id: andy.id, hospital_id: sentosa.id )
schedule_b5 = Schedule.find_or_create_by( operational_time: "10:00".to_time, day: "Friday", 
                                          doctor_id: andy.id, hospital_id: sentosa.id )

# schedule annie
schedule_an1 = Schedule.find_or_create_by( operational_time: "11:00".to_time, day: "Wednesday", 
  doctor_id: annie.id, hospital_id: hermina.id )
schedule_an2 = Schedule.find_or_create_by( operational_time: "11:00".to_time, day: "Thursday", 
  doctor_id: annie.id, hospital_id: hermina.id )
schedule_an3 = Schedule.find_or_create_by( operational_time: "18:00".to_time, day: "Thursday", 
  doctor_id: annie.id, hospital_id: harapan_kita.id )
schedule_an4 = Schedule.find_or_create_by( operational_time: "11:00".to_time, day: "Friday", 
  doctor_id: annie.id, hospital_id: hermina.id )
schedule_an5 = Schedule.find_or_create_by( operational_time: "18:00".to_time, day: "Friday", 
  doctor_id: annie.id, hospital_id: harapan_kita.id )
schedule_an6 = Schedule.find_or_create_by( operational_time: "11:00".to_time, day: "Saturday", 
  doctor_id: annie.id, hospital_id: hermina.id )
schedule_an7 = Schedule.find_or_create_by( operational_time: "11:00".to_time, day: "Sunday", 
  doctor_id: annie.id, hospital_id: hermina.id )


# schedule sarah
schedule_s1 = Schedule.find_or_create_by( operational_time: "14:00".to_time, day: "Wednesday", 
  doctor_id: sarah.id, hospital_id: harapan_kita.id )
schedule_s2 = Schedule.find_or_create_by( operational_time: "14:00".to_time, day: "Thursday", 
  doctor_id: sarah.id, hospital_id: harapan_kita.id )
schedule_s3 = Schedule.find_or_create_by( operational_time: "14:00".to_time, day: "Friday", 
  doctor_id: sarah.id, hospital_id: harapan_kita.id )
schedule_s4 = Schedule.find_or_create_by( operational_time: "14:00".to_time, day: "Saturday", 
  doctor_id: sarah.id, hospital_id: harapan_kita.id )
schedule_s5 = Schedule.find_or_create_by( operational_time: "14:00".to_time, day: "Sunday", 
  doctor_id: sarah.id, hospital_id: harapan_kita.id )

# schedule jodie
schedule_s1 = Schedule.find_or_create_by( operational_time: "08:00".to_time, day: "Monday", 
  doctor_id: jodie.id, hospital_id: siloam.id )
schedule_s2 = Schedule.find_or_create_by( operational_time: "08:00".to_time, day: "Wednesday", 
  doctor_id: jodie.id, hospital_id: siloam.id )
schedule_s3 = Schedule.find_or_create_by( operational_time: "08:00".to_time, day: "Friday", 
  doctor_id: jodie.id, hospital_id: siloam.id )
