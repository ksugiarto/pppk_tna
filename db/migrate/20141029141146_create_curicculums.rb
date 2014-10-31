class CreateCuricculums < ActiveRecord::Migration
  def change
    create_table :curicculums do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
