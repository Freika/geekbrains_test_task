# frozen_string_literal: true

class Participations::Create
  def call(course_id, group_id, user_id)
    course = Course.includes(:groups).find_by(id: course_id)
    return course_not_found unless course

    group = course.groups.find_by(id: group_id)
    return group_not_found unless group

    participation = Participation.create(group_id: group_id, user_id: user_id)

    participation.persisted? ? success_message : failure_message
  end

  private

  def success_message
    'You have successfully joined to this course!'
  end

  def failure_message
    'It seems like you already on this course! Try another group!'
  end

  def course_not_found
    'Course not found'
  end

  def group_not_found
    'Group not found'
  end
end
