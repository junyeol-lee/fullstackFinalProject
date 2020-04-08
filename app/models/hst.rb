# frozen_string_literal: true

class Hst < ApplicationRecord
  validates :province, :rate, presence: true
end
