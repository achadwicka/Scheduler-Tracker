class AtributesToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :rut, :string
    add_column :clients, :birth_date, :date
    add_column :clients, :cel_number, :string
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string    

  end
end
