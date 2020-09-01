class AddTimesToMedicines < ActiveRecord::Migration[5.2]
  def change
    add_column :medicines, :times, :integer
  end
end
