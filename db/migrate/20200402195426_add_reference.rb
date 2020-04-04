# frozen_string_literal: true

class AddReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :provinces, :user, index: true
    add_foreign_key :provinces, :users
  end
end
