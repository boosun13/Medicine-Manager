class AddColumnSex < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sexes , :integer
  end
end
