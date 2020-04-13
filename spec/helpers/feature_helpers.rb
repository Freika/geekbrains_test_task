# frozen_string_literal: true

module FeatureHelpers
  def sign_in(user)
    visit root_path
    click_on 'Log In'

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'
  end

  def join_course(course)
    visit root_path
    click_on course.title
    click_on 'Join'
  end
end
