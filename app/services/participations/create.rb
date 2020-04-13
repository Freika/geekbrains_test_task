# frozen_string_literal: true

class Participations::Create
  def call(course, group_id, user_id)
    group = course.groups.find_by(id: group_id)
    return 'Group not found' unless group

    participation = Participation.create(group_id: group_id, user_id: user_id)

    participation.persisted? ? success_message : participation.errors.full_messages.join(', ')
  end

  private

  def success_message
    'You have successfully joined to this course!'
  end
end
