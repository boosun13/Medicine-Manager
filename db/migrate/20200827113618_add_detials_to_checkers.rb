class AddDetialsToCheckers < ActiveRecord::Migration[5.2]
  def change
    add_column :checkers, :timing, :integer
    add_column :checkers, :dose, :integer
  end
end
