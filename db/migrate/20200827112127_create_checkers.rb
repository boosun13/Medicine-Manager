class CreateCheckers < ActiveRecord::Migration[5.2]
  def change
    create_table :checkers do |t|
      t.integer :medicine_id
      t.datetime :check_date

      t.timestamps
    end
  end
end
