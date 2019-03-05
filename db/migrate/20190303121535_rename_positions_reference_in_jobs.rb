class RenamePositionsReferenceInJobs < ActiveRecord::Migration[5.2]
  def change
        rename_column :jobs, :positions_id, :position_id

  end
end
