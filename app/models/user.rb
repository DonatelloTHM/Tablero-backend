# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :to_dos
  has_many :journals

  validates :username, uniqueness: true
end
