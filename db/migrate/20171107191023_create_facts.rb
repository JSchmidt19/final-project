class CreateFacts < ActiveRecord::Migration[5.0]
  def change
    create_table :facts do |t|
      t.string :title
      t.text :body
      t.integer :fact_id

      t.timestamps
    end
  end
end
