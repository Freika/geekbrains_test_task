# frozen_string_literal: true

describe 'Courses', type: :feature do
  let!(:user) { create(:user, email: 'existing@user.com') }
  let!(:course) { create(:course) }
  let!(:group) { create(:group, course: course) }

  before { sign_in(user) }

  it 'user can join course group' do
    join_course(course)

    expect(page).to have_content('You have successfully joined to this course!')
  end

  it 'user can leave course group' do
    join_course(course)

    visit course_path(course)
    click_on 'Leave'

    expect(page).to have_content('You successfully left this course :(')
  end

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
