class CreateEventExams < ActiveRecord::Migration
  def change
    create_table :event_exams do |t|
      t.integer :event_id
      t.text :description
      t.string :exam_type

      t.timestamps
    end
  end
end
