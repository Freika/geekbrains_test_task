# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :participations
  has_many :groups, through: :participations

  validates :email, presence: true, uniqueness: true
end
