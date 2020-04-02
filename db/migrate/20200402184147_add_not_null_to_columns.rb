# frozen_string_literal: true

class AddNotNullToColumns < ActiveRecord::Migration[6.0]
  def change
    change_column_null :orders, :users_id, false
  end
end
