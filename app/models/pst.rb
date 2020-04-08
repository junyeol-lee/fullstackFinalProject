# frozen_string_literal: true

class Pst < ApplicationRecord
  validates :province, :rate, presence: true
end
