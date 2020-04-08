# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products
  validates :name, :description, :cost_cents, presence: true
end
