class CreateTeacherAnswerDetails < ActiveRecord::Migration
  def change
    create_table :teacher_answer_details do |t|
      t.integer :teacher_answer_id
      t.integer :question_id
      t.integer :subject_id
      t.integer :answer
      t.integer :is_correct

      t.timestamps
    end
  end
end
