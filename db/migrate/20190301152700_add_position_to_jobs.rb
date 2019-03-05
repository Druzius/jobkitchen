class AddPositionToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :positions, foreign_key: true
  end
end
