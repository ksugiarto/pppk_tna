class CreateTeacherHistories < ActiveRecord::Migration
  def change
    create_table :teacher_histories do |t|
      t.integer :teacher_id
      t.integer :event_id
      t.integer :event_participant_id
      t.integer :status

      t.timestamps
    end
  end
end
