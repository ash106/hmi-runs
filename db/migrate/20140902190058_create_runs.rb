class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.date :date_of
      t.decimal :distance
      t.references :user, index: true

      t.timestamps
    end
  end
end
