class CreateSchoolVocationals < ActiveRecord::Migration
  def change
    create_table :school_vocationals do |t|
      t.integer :school_id
      t.integer :vocational_id
      t.text :notes

      t.timestamps
    end
  end
end
