require 'faker'

#DELETE ALL
ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE")
Speciality.delete_all
City.delete_all
Doctor.delete_all
Patient.delete_all
Appointment.delete_all

#SPECIALITY
speciality = Speciality.create!(name: "Medical doctor")
speciality.save
speciality = Speciality.create!(name: "Psychologist")
speciality.save

#CITY
40.times do
  city = City.create!(name: Faker::Address.city, postal_code: Faker::Address.zip_code)
end

#DOCTORS
40.times do
	doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, speciality_id: rand(1..Speciality.count), city_id: rand(1..City.count))
end

#PATIENTS
50.times do
	patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: rand(1..City.count))
end

#APPOINTMENTS
20.times do
	appointment = Appointment.create!(patient_id: rand(1..Patient.count), doctor_id: rand(1..Doctor.count), date: Faker::Date.forward(60), city_id: rand(1..City.count))
end
