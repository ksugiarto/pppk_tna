class CreateRequestParticipants < ActiveRecord::Migration
  def change
    create_table :request_participants do |t|
      t.integer :school_request_id
      t.integer :teacher_id
      t.text :notes

      t.timestamps
    end
  end
end
