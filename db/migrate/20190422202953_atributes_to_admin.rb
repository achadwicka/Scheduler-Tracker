class AtributesToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :rut, :string
    add_column :admins, :birth_date, :datetime
    add_column :admins, :cel_number, :string
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
  end
end
