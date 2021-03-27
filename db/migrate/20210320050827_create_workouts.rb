class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
    t.string :work_out
    t.string :description
    t.integer :macro_counter
    end
  end
end
