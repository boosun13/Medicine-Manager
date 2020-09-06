class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.datetime :start_time
      t.datetime :visit_date
      t.string :hospital
      t.string :doctor
      t.string :pharmacy

      t.timestamps
    end
  end
end
