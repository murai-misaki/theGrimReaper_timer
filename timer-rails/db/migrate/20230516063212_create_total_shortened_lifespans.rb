class CreateTotalShortenedLifespans < ActiveRecord::Migration[6.0]
  def change
    create_table :total_shortened_lifespans do |t|
      t.integer :time, default: 0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
