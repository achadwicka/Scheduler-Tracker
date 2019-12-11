class AtributesToDiagnosis < ActiveRecord::Migration[5.1]
  def change
    add_column :diagnoses, :date, :datetime
    add_column :diagnoses, :description, :text

  end
end
