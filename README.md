# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

please run rake db:seed first, i have provide basic record for this application.

list API: 

register : POST /api/v1/auth params: email, name, password, password_confirmation
login : POST /api/v1/auth/sign_in params: email, password

get doctor list : GET /api/v1/doctors
get hospital list : GET /api/v1/hospitals

you need to login first before access this API : 
you need to provide access-token, Content-Type, token-type, client, uid, expiry informations at headers

booking : POST api/v1/bookings params: hospital_id, booking[booking_date], booking[schedule_id]
  hospital_id : provided by select box, after this changed schedule list will change.
  booking[booking_date] format "2020-06-30", this value provided by calender
  booking[schedule_id] : schedule list depend on the date user choose (after date choosed, it   
                         will convert to day name) and hospital name.

user booking list : GET api/v1/booking_list
display doctor schedules with total patient : GET /api/v1/doctor_schedule_list params: date, doctor_id
display doctor schedules with total patient based on hospital : GET /api/v1/doctor_hospital_schedule_list params: date, doctor_id, hospital_id


