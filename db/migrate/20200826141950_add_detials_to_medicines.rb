class AddDetialsToMedicines < ActiveRecord::Migration[5.2]
  def change
    add_column :medicines, :type, :string
  end
end
