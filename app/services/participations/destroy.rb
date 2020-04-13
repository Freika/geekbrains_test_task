# frozen_string_literal: true

class Participations::Destroy
  def call(course, group_id, user_id)
    group = course.groups.find_by(id: group_id)
    return group_not_found unless group

    participation = group.participations.find_by(group_id: group_id, user_id: user_id)
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

  def group_not_found
    'Group not found'
  end
end
