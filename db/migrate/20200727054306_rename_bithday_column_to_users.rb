class RenameBithdayColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :bithday, :birthday
  end
end
