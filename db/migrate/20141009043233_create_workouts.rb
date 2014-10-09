class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.date :date_of
      t.integer :length
      t.references :user, index: true

      t.timestamps
    end
  end
end
