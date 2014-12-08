class CreateEventMatters < ActiveRecord::Migration
  def change
    create_table :event_matters do |t|
      t.integer :event_id
      t.text :notes

      t.timestamps
    end
  end
end
