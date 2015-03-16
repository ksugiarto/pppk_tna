class CreateTeacherAnswers < ActiveRecord::Migration
  def change
    create_table :teacher_answers do |t|
      t.integer :teacher_id
      t.integer :event_exam_id
      t.float :score

      t.timestamps
    end
  end
end
