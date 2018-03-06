# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.create(
name: 'Naples Grande - Yellow',
city: 'Naples',
state: 'FL',
slope: 70.6,
rating: 129
)

User.create(
name: 'Nick',
hometown: 'Aurora',
)
