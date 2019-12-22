# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  %w[admin teacher].each do |role|
    User.create!(
      email: "#{role}@example.com",
      password: 'password',
      password_confirmation: 'password',
      role: role
    )
  end

  10.times do |i|
    User.create!(
      role: :student,
      email: "student#{i + 1}@example.com",
      password: 'password',
      password_confirmation: 'password'
    )
  end

  %w[Ruby Python Go JavaScript].each do |language|
    Course.create!(
      name: language,
      description: "Язык программирования #{language}"
    )
  end

  ruby_course = Course.find_by(name: 'Ruby')
  python_course = Course.find_by(name: 'Python')
  js_course = Course.find_by(name: 'JavaScript')
  go_course = Course.find_by(name: 'Go')

  ruby_past_group = Group.create!(
    course: ruby_course,
    date_start: '01-01-2019',
    date_finish: '01-02-2019'
  )
  ruby_current_group = Group.create!(
    course: ruby_course,
    date_start: '01-12-2019',
    date_finish: '01-02-2020'
  )
  ruby_future_group_march = Group.create!(
    course: ruby_course,
    date_start: '01-03-2020',
    date_finish: '01-06-2020'
  )
  ruby_future_group_may = Group.create!(
    course: ruby_course,
    date_start: '01-05-2020',
    date_finish: '01-08-2020'
  )
  python_past_group = Group.create!(
    course: python_course,
    date_start: '01-02-2019',
    date_finish: '01-05-2019'
  )
  python_future_group = Group.create!(
    course: python_course,
    date_start: '01-05-2020',
    date_finish: '01-07-2020'
  )
  go_group = Group.create!(
    course: go_course,
    date_start: '01-08-2020',
    date_finish: '01-10-2020'
  )
  js_group = Group.create!(
    course: js_course,
    date_start: '01-03-2019',
    date_finish: '01-04-2019'
  )

  UserGroup.create!(group: ruby_past_group, user: User.find_by(email: 'student1@example.com'))
  UserGroup.create!(group: ruby_current_group, user: User.find_by(email: 'student2@example.com'))
  UserGroup.create!(group: ruby_current_group, user: User.find_by(email: 'student3@example.com'))
  UserGroup.create!(group: ruby_future_group_march, user: User.find_by(email: 'student4@example.com'))
  UserGroup.create!(group: ruby_future_group_march, user: User.find_by(email: 'student5@example.com'))
  UserGroup.create!(group: ruby_future_group_march, user: User.find_by(email: 'student9@example.com'))
  UserGroup.create!(group: ruby_future_group_may, user: User.find_by(email: 'student10@example.com'))
  UserGroup.create!(group: python_past_group, user: User.find_by(email: 'student6@example.com'))
  UserGroup.create!(group: python_future_group, user: User.find_by(email: 'student5@example.com'))
  UserGroup.create!(group: python_future_group, user: User.find_by(email: 'student7@example.com'))
  UserGroup.create!(group: go_group, user: User.find_by(email: 'student5@example.com'))
  UserGroup.create!(group: go_group, user: User.find_by(email: 'student8@example.com'))
  UserGroup.create!(group: go_group, user: User.find_by(email: 'student9@example.com'))
  UserGroup.create!(group: go_group, user: User.find_by(email: 'student10@example.com'))
end