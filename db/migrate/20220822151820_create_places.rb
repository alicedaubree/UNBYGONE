class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :title
      t.text :description
      t.string :available_for
      t.string :type_of_place

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
