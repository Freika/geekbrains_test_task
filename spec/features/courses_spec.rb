# frozen_string_literal: true

describe 'Courses', type: :feature do
  context 'when visiting course' do
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
  end

  context 'when sorting courses' do
    let!(:nearest_course)  { create(:course) }
    let!(:farthest_course) { create(:course) }
    let!(:nearest_group)   { create(:group, course: nearest_course, starts_on: 1.day.from_now) }
    let!(:farthest_group)  { create(:group, course: farthest_course, starts_on: 2.days.from_now) }

    it 'by default they are sorted by nearest' do
      visit courses_path

      first_row = find(:xpath, '//table/tbody/tr/td', match: :first)

      expect(first_row).to have_content(nearest_course.title)
    end

    it 'by nearest group start' do
      visit courses_path

      2.times { find('#sort_courses').click }

      first_row = find(:xpath, '//table/tbody/tr/td', match: :first)

      expect(first_row).to have_content(nearest_course.title)
    end

    it 'by farthest group start' do
      visit courses_path

      find('#sort_courses').click

      first_row = find(:xpath, '//table/tbody/tr/td', match: :first)

      expect(first_row).to have_content(farthest_course.title)
    end
  end
end
