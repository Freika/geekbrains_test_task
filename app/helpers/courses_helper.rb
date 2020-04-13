# frozen_string_literal: true

module CoursesHelper
  def participants_number(course)
    course.groups.flat_map(&:participations).size
  end

  def beginning_date(course)
    course.groups.upcoming.first.starts_on
  end
end
