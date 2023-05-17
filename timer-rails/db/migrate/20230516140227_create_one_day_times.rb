class CreateOneDayTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :one_day_times do |t|
      t.integer :count_up, default: 0, null: false
      t.integer :exercise, default: 0, null: false
      t.integer :shortened_lifespan, default: 0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
