class CreateBasicCompetencies < ActiveRecord::Migration
  def change
    create_table :basic_competencies do |t|
      t.integer :core_competency_id
      t.integer :seq_num
      t.text :description

      t.timestamps
    end
  end
end
