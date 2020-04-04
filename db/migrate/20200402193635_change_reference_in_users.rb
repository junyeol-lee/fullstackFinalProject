# frozen_string_literal: true

class ChangeReferenceInUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :provinces_id
  end
end
