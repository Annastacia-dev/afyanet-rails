# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Doctor Specialties

puts 'Creating specialties...'

Specialty.create!([
  {name: "General Practitioner", image:"fa-solid fa-user-doctor"},
  {name: "Optician", "image": "fa-solid fa-glasses"},
  {name: "Dentist","image": "fa-solid fa-tooth"},
  {name: "Nutritionist",image:"fa-solid fa-apple-whole"},
  {name: "Psychiatrist",image:"fa-solid fa-head-side-virus"},
  {name: "Cardiologist",image:"fa-solid fa-heart"},
  {name: "Dermatologist", image:"fa-solid fa-hand-dots"},
  {name: "Gastroenterologist",image:"fa-solid fa-vial-virus"},
  {name: "Therapist",image:"fa-solid fa-hand-holding-heart"},
  {name: "Oncologist",image:"fa-solid fa-bone"},
  {name: "Paediatrician",image:"fa-solid fa-children"},
  {name: "Gynaecologist",image:"fa-solid fa-venus"},
  {name: "Urologist",image:"fa-solid fa-stethoscope"},
  {name: "Neurologist",image:"fa-solid fa-brain"},
  {name: "Ophthalmologist",image:"fa-solid fa-eye"},
  {name: "Immunologist",image:"fa-solid fa-syringe"},
  {name: "Endocrinologist",image:"fa-solid fa-microscope"},
  {name: "Rheumatologist",image:"fa-solid fa-dna"},
])

puts 'Specialties created!'

# Doctor
puts 'Creating Doctor'

Doctor.create!([{
  "first_name":"Ashley",
    "last_name":"Smith",
    "email":"ashley@gmail.com",
    "phone_number":"0712345906",
    "password":"@Ashley13",
    "password_confirmation":"@Ashley13",
    "licence_no": 54321,
    "specialty_id":3,
    "location":"Karen",
    "days_available_weekly":"monday,tuesday,wednesday,thursday",
    "contract_length":6,
    "specific_days_times_available":"09:00:00"
}])

puts 'Doctor created!'

# Patient
puts 'Creating Patient'

Patient.create!([{
  "first_name": "Sylvia",
    "last_name": "Kamau",
    "email":"sylvia@gmail.com",
    "phone_number": "0768372439",
    "location":"Karen",
    "date_of_birth":"01/07/1999",
    "password":"@Sylvia33",
    "password_confirmation":"@Sylvia33"
} ])

puts 'Patient created!'
