class CreateMedicines < ActiveRecord::Migration[5.2]
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :usage
      t.integer :days
      t.decimal :dose
      t.text :effect
      t.text :side_effect
      t.references :prescription, foreign_key: true

      t.timestamps
    end
  end
end
