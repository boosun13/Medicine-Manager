class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bithday, :date
    add_column :users, :age, :integer
  end
end
