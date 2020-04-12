# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :groups

  validates :title, presence: true, uniqueness: true
end
