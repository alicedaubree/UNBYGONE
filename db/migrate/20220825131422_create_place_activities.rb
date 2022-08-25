class CreatePlaceActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :place_activities do |t|
      t.references :place, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
