# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "ant", email: "a@email.com", password: "foobar23", password_confirmation: "foobar23")
User.create(name: "burt", email: "b@email.com", password: "foobar23", password_confirmation: "foobar23")
User.create(name: "clyde", email: "c@email.com", password: "foobar23", password_confirmation: "foobar23")
