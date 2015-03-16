class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :basic_competency_id
      t.integer :seq_num
      t.string :description

      t.timestamps
    end
  end
end
