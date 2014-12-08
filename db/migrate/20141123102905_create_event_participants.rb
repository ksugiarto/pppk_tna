class CreateEventParticipants < ActiveRecord::Migration
  def change
    create_table :event_participants do |t|
      t.integer :event_id
      t.integer :teacher_id
      t.integer :total_presence
      t.integer :event_exam_id
      t.integer :exam_grade
      t.integer :status

      t.timestamps
    end
  end
end
