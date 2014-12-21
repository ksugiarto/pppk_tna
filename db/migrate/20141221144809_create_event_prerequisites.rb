class CreateEventPrerequisites < ActiveRecord::Migration
  def change
    create_table :event_prerequisites do |t|
      t.integer :event_id
      t.integer :min_age
      t.integer :max_age
      t.integer :max_event_count
      t.integer :min_long_teach
      t.integer :max_long_teach

      t.timestamps
    end
  end
end
