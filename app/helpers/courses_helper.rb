# frozen_string_literal: true

module CoursesHelper
  def participants_number(course)
    course.groups.flat_map(&:participations).size
  end

  def beginning_date(course)
    course.groups.upcoming.first.starts_on
  end

  def ordering_link(filter_by)
    if filter_by == 'nearest' || filter_by.nil?
      link_to 'Starts on 🔽', courses_path(filter_by: :farthest), id: 'sort_courses'
    else
      link_to 'Starts on 🔼', courses_path(filter_by: :nearest), id: 'sort_courses'
    end
  end
end
