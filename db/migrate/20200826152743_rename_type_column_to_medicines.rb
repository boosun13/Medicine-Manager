class RenameTypeColumnToMedicines < ActiveRecord::Migration[5.2]
  def change
    rename_column :medicines, :type, :medicine_type
    rename_column :medicines, :Detail_type,  :detail_type
  end
end
