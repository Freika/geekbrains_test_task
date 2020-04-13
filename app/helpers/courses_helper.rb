# frozen_string_literal: true

module CoursesHelper
  def participants_number(course)
    course.groups.flat_map(&:participations).size
  end
end
