class CreateRefreneceTwo < ActiveRecord::Migration[5.2]
  def change
    add_reference :workouts, :user
  end
end
