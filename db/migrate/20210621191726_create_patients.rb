class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :age
      t.string :state
      t.string :city
    end
  end
end
