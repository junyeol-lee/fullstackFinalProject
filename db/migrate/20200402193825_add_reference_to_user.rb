# frozen_string_literal: true

class AddReferenceToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :province, index: true
  end
end
