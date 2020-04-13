# frozen_string_literal: true

class Participations::Create
  def call(course, group_id, user_id)
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

  def group_not_found
    'Group not found'
  end
end
