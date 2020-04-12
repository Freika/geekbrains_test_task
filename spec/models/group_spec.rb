# frozen_string_literal: true

describe Group, type: :model do
  it { is_expected.to belong_to(:course) }
  it { is_expected.to have_many(:participations) }
  it { is_expected.to have_many(:users).through(:participations) }
  it { is_expected.to validate_presence_of(:starts_on) }
end
