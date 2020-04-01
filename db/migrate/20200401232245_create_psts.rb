class CreatePsts < ActiveRecord::Migration[6.0]
  def change
    create_table :psts do |t|
      t.string :province
      t.decimal :rate

      t.timestamps
    end
  end
end
