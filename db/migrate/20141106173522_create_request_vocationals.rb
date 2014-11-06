class CreateRequestVocationals < ActiveRecord::Migration
  def change
    create_table :request_vocationals do |t|
      t.integer :school_request_id
      t.integer :vocational_id
      t.text :notes

      t.timestamps
    end
  end
end
