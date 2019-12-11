class CreateTreatments < ActiveRecord::Migration[5.1]
  def change
    create_table :treatments do |t|
      t.text :comment
      t.integer :client_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
