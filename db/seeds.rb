require 'faker'

#DELETE ALL
ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE")
Patient.delete_all
Appointment.delete_all
Doctor.delete_all

#PATIENTS
50.times do
	patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

#DOCTORS
40.times do
	doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, speciality: "Medical doctor", postal_code: Faker::Address.zip_code)
end

#APPOINTMENTS
20.times do
	appointment = Appointment.create!(patient_id: rand(1..Patient.count), doctor_id: rand(1..Doctor.count), date: Faker::Date.forward(60))
end
