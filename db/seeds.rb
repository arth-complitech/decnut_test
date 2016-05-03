# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
marriott = Group.create!(name: "Marriott")
hyatt = Group.create!(name: "Hyatt")
puts "=================+Groups Created============"

marriott_newyork = Department.create!(name: "New York", group_id: marriott.id)
marriott_los = Department.create!(name: "Los Angeles", group_id: marriott.id)

hyatt_newyork = Department.create!(name: "New York", group_id: hyatt.id)
hyatt_los = Department.create!(name: "Los Angeles", group_id: hyatt.id)
puts "=====================+Departments Created=============="

LocalUser.create!(email: "marriottlocaluser@yopmail.com", password: "12345678", password_confirmation: "12345678", first_name: "Local", last_name: "User", department_id: marriott_newyork.id, title: "Mr.", mobile_number: "9687047348")
LocalAdmin.create!(email: "marriottlocaladmin@yopmail.com", password: "12345678", password_confirmation: "12345678", first_name: "Local", last_name: "User", department_id: marriott_newyork.id, title: "Mr.", mobile_number: "9687047348")
ContentAdmin.create!(email: "marriottcontentadmin@yopmail.com", password: "12345678", password_confirmation: "12345678", first_name: "Local", last_name: "User", department_id: marriott_newyork.id, title: "Mr.", mobile_number: "9687047348")

LocalUser.create!(email: "hyattlocaluser@yopmail.com", password: "12345678", password_confirmation: "12345678", first_name: "Local", last_name: "User", department_id: hyatt_newyork.id, title: "Mr.", mobile_number: "9687047348")
LocalAdmin.create!(email: "hyattlocaladmin@yopmail.com", password: "12345678", password_confirmation: "12345678", first_name: "Local", last_name: "User", department_id: hyatt_newyork.id, title: "Mr.", mobile_number: "9687047348")
ContentAdmin.create!(email: "hyattcontentadmin@yopmail.com", password: "12345678", password_confirmation: "12345678", first_name: "Local", last_name: "User", department_id: hyatt_newyork.id, title: "Mr.", mobile_number: "9687047348")
puts "===========================+Users Created================"
