# frozen_string_literal: true

describe User, type: :model do
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:email) }
end
