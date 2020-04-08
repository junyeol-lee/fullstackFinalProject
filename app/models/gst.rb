# frozen_string_literal: true

class Gst < ApplicationRecord
  validates :rate, presence: true
end
