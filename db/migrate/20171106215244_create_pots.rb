class CreatePots < ActiveRecord::Migration[5.0]
  def change
    create_table :pots do |t|
      t.integer :pot_id
      t.string :title
      t.text :description
      t.float :price
      t.string :size
      t.string :color
      t.string :style
      t.string :glazes

      t.timestamps
    end
  end
end
