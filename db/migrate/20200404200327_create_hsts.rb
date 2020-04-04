class CreateHsts < ActiveRecord::Migration[6.0]
  def change
    create_table :hsts do |t|
      t.string :province
      t.decimal :rate

      t.timestamps
    end
  end
end
