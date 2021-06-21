class CreateReviews < ActiveRecord::Migration[6.0]
  def change
     create_table :reviews do|t|
      t.integer :patient_id
      t.integer :hospital_id
      t.integer :rating
      t.string :comment
    end
  end
end
