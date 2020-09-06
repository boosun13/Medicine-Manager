class AddDetailTypeToMedicines < ActiveRecord::Migration[5.2]
  def change
    add_column :medicines, :Detail_type, :string
  end
end
