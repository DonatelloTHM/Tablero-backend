# frozen_string_literal: true

class User < ApplicationRecord
  has_many :notes
  has_many :to_dos
  has_many :journals
end
