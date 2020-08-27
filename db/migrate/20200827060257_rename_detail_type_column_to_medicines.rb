class RenameDetailTypeColumnToMedicines < ActiveRecord::Migration[5.2]
  def change
    rename_column :medicines, :Detail_type,  :detail_type
  end
end
