# frozen_string_literal: true

describe Course, type: :model do
  subject { create(:course) }

  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to validate_presence_of(:title) }
end
