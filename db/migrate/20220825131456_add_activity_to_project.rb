class AddActivityToProject < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :activity, foreign_key: true
  end
end
