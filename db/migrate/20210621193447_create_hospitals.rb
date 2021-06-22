class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do|t|
      t.string :name
      t.string :state
      t.string :city
      t.string :hospital_type
    end
  end
end
