class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :event_exam_id
      t.text :content
      t.text :answer_1
      t.text :answer_2
      t.text :answer_3
      t.text :answer_4
      t.integer :right_answer
      t.integer :score
      t.text :notes

      t.timestamps
    end
  end
end
