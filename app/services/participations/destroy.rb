# frozen_string_literal: true

class Participations::Destroy
  def call(course_id, group_id, user_id)
    course = Course.find_by(id: course_id)
    return course_not_found unless course

    participation = Participation.find_by(group_id: group_id, user_id: user_id)
    return failure_message unless participation

    participation.destroy

    success_message
  end

  private

  def success_message
    'You successfully left this course :('
  end

  def failure_message
    'You are not on this course so you can not leave it!'
  end

  def course_not_found
    'Course not found'
  end
end
