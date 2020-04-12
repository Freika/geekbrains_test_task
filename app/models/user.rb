# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :participations

  validates :email, presence: true, uniqueness: true
end
