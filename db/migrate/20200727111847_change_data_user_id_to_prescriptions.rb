class ChangeDataUserIdToPrescriptions < ActiveRecord::Migration[5.2]
  def change
    change_column :prescriptions, :user_id, :integer
  end
end
