# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :course

  validates :starts_on, presence: true

  scope :upcoming, -> { where('starts_on > ?', Time.current) }
end
