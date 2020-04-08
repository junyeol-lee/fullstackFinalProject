# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :products, through: :order_products
  has_one_attached :image
end
