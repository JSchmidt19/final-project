class AddSecondPasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :second_password, :string
  end
end
