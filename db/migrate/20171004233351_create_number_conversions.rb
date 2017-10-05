class CreateNumberConversions < ActiveRecord::Migration[5.1]
  def change
    create_table :number_conversions do |t|
      t.integer :number
      t.integer :from_base
      t.integer :to_base

      t.timestamps
    end
  end
end
