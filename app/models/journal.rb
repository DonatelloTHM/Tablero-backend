# frozen_string_literal: true

class Journal < ApplicationRecord
  belongs_to :user

  scope :filter_by_phrase, ->(phrase) { where('unformatted ILIKE ? OR title ILIKE ?', "%#{phrase}%", "%#{phrase}%") }
end
