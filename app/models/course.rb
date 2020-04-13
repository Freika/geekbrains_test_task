# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :groups

  validates :title, presence: true, uniqueness: true

  scope :nearest,   -> { joins(:groups).merge(Group.order(starts_on: :asc)) }
  scope :farthest, -> { joins(:groups).merge(Group.order(starts_on: :desc)) }
end
