class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :vocational_id
      t.date :date_start
      t.date :date_end
      t.text :description
      t.text :result_notes
      t.integer :status

      t.timestamps
    end
  end
end
