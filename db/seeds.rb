# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r = Role.create!({name: "HR"})
d = Designation.create!({name: "Web Developer"})
Employee.create!({email:"pagal123@gmail.com", name: "payal", password: 'password', password_confirmation: 'password', role_id: r.id, designation_id: d.id})
GlobelSetting.create!(leave_increment_date: Date.today.beginning_of_month)

