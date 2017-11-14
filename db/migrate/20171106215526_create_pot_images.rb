class CreatePotImages < ActiveRecord::Migration[5.0]
  def change
    create_table :pot_images do |t|
      t.belongs_to :pot, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
