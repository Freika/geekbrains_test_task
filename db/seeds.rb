# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Course.none?
  FactoryBot.create_list(:course, 3)
  p 'Courses were created'
end

if Group.none?
  Course.find_each do |course|
    course.groups.create(
      [
        { starts_on: Time.current + 1.day },
        { starts_on: Time.current + 8.days }
      ]
    )
  end

  p 'Groups for courses were created'
end
