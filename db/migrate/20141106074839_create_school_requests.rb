class CreateSchoolRequests < ActiveRecord::Migration
  def change
    create_table :school_requests do |t|
      t.integer :school_id
      t.string :reference_number
      t.date :request_date
      t.text :notes

      t.timestamps
    end
  end
end
