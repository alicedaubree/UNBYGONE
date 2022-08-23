class ChangeTypeColumnPlace < ActiveRecord::Migration[7.0]
  def change
    rename_column :places, :type, :type_of_place
  end
end
