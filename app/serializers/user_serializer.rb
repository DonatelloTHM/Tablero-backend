# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :location, :email, :to_dos , :notes

  has_many :to_dos
  has_many :notes
end
