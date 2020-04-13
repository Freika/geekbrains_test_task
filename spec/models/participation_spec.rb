# frozen_string_literal: true

describe Participation, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:group) }
  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:group_id) }
end
