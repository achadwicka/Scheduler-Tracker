class AtributesToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :rut, :string
    add_column :doctors, :birth_date, :datetime
    add_column :doctors, :cel_number, :string
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string
  end
end
