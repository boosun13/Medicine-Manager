class AddColumnToPrescription < ActiveRecord::Migration[5.2]
  def change
    add_column :prescriptions, :user_id, :string
  end
end
