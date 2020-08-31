class ChangeDatatypeDoseOfCheckers < ActiveRecord::Migration[5.2]
  def change
    change_column :medicines, :dose, :decimal, :precision => 10, :scale => 2
    change_column :checkers, :dose, :decimal, :precision => 10, :scale => 2
  end
end
