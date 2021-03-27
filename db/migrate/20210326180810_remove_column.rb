class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :workouts, :user_id
  end
end
