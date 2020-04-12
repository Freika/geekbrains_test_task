# frozen_string_literal: true

describe Participation, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:group) }
end
