class ChangeDatatypeExerciseOfOneDayTimes < ActiveRecord::Migration[6.0]
  def change
    change_column :one_day_times, :exercise, :float
  end
end
