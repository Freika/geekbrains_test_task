# frozen_string_literal: true

class ParticipationContainer
  extend Dry::Container::Mixin

  register(:create)   { Participations::Create.new }
  register(:destroy)  { Participations::Destroy.new }
end
