class CreateRails < ActiveRecord::Migration[5.2]
  def change
    create_table :rails do |t|
      t.string :g
      t.model :rspec
      t.string :user

      t.timestamps
    end
  end
end
